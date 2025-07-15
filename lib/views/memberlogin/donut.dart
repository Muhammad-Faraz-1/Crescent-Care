import 'package:flutter/material.dart';

class DonutProgressIndicator extends StatelessWidget {
  final double percentage;
  final Color backgroundColor;
  final Color fillColor;
  final double size;
  final double strokeWidth;
  final bool seperate;

  const DonutProgressIndicator({
    super.key,
    required this.percentage,
    this.backgroundColor = const Color(0xFFD1C8F0),
    this.fillColor = const Color(0xFF6962BB),
    this.size = 80,
    this.strokeWidth = 6,
    this.seperate = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
            ),
          ),
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(fillColor),
              backgroundColor: Colors.transparent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(percentage * 100).toInt()}%',
                style: TextStyle(
                  fontSize: size * 0.25,
                  fontWeight: FontWeight.bold,
                  color: seperate == true ? Color(0xffffffff) : fillColor,
                ),
              ),
              Text(
                'Utilized',
                style: TextStyle(
                  fontSize: size * 0.15,
                  color: seperate == true ? Color(0xffffffff) : fillColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
