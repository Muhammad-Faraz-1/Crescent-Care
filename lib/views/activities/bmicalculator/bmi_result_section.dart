import 'dart:math';
import 'package:flutter/material.dart';

class BMIResultPage extends StatefulWidget {
  final List<String?> valuesToShow;
  final double? finalBMI;
  final String? statusLabel;
  final double? perfectWeight;

  const BMIResultPage({
    super.key,
    required this.valuesToShow,
    required this.finalBMI,
    required this.statusLabel,
    required this.perfectWeight,
  });

  @override
  State<BMIResultPage> createState() => _BMIResultPageState();
}

class _BMIResultPageState extends State<BMIResultPage>
    with TickerProviderStateMixin {
  late AnimationController _wheelController;
  late AnimationController _bmiRevealController;
  late AnimationController _cardController;
  late AnimationController _waveController;
  late AnimationController _fillController;

  double _wavePhase = 0;
  double _currentLevel = 1;
  late double _targetLevel;
  Color _fillColor = Colors.transparent;

  int _currentIndex = 0;
  bool _showFinalBMI = false;

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
      setState(() => _wavePhase += 0.1);
    });

    _fillController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _wheelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bmiRevealController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _startAnimationFlow();
  }

  Future<void> _startAnimationFlow() async {
    for (int i = 0; i < widget.valuesToShow.length; i++) {
      setState(() => _currentIndex = i);
      await _wheelController.forward(from: 0);
      await Future.delayed(const Duration(milliseconds: 500));
    }

    setState(() => _showFinalBMI = true);
    await _bmiRevealController.forward();

    _startWaveFill();
    await Future.delayed(const Duration(seconds: 2));
    await _cardController.forward();
  }

  void _startWaveFill() {
    _waveController.repeat();

    _targetLevel = 1 - (widget.finalBMI!.clamp(0, 40) / 40);
    _fillColor = _getBMIColor(widget.finalBMI!);
    _currentLevel = 1.0;

    Animation<double> levelTween = Tween(
      begin: 1.0,
      end: _targetLevel,
    ).animate(CurvedAnimation(parent: _fillController, curve: Curves.easeOut));

    levelTween.addListener(() {
      setState(() => _currentLevel = levelTween.value);
    });

    _fillController.forward();
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) return Colors.blueAccent;
    if (bmi < 24.9) return Colors.green;
    if (bmi < 29.9) return Colors.amber;
    return Colors.redAccent;
  }

  @override
  void dispose() {
    _waveController.dispose();
    _fillController.dispose();
    _wheelController.dispose();
    _bmiRevealController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.grey[200],
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (_showFinalBMI)
                      CustomPaint(
                        size: const Size(200, 200),
                        painter: _WavePainter(
                          phase: _wavePhase,
                          level: _currentLevel * 200,
                          color: _fillColor,
                        ),
                      ),
                    !_showFinalBMI
                        ? SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset.zero,
                          ).animate(_wheelController),
                          child: Text(
                            widget.valuesToShow[_currentIndex]!,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        : FadeTransition(
                          opacity: _bmiRevealController,
                          child: Text(
                            widget.finalBMI!.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(_cardController),
              child: Column(
                children: [
                  Text(
                    widget.statusLabel!,
                    style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "The healthy weight range is",
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Perfect Weight",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "${widget.perfectWeight!.toStringAsFixed(1)} KG",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child:  Text("Go Back",style: TextStyle(color: theme.tertiaryContainer),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final double phase;
  final double level;
  final Color color;

  _WavePainter({required this.phase, required this.level, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    path.moveTo(0, level);

    for (double x = 0; x <= size.width; x++) {
      double y = sin((x / size.width * 2 * pi) + phase) * 10 + level;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => true;
}
