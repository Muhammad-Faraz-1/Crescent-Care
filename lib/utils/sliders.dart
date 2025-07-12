import 'dart:async';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// Your custom card widget
class MyCustomCard extends StatelessWidget {
  final String title;
  final Color color;

  const MyCustomCard({required this.title, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      // height: 120.h,
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        gradient: LinearGradient(colors: [theme.onTertiary, theme.primary]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 83.w, child: Image.asset('assets/img/bp-check.png')),
          SizedBox(width: 10.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  size: body,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: theme.tertiaryContainer,
                  val: 'Have BP/Sugar?',
                ),
                TextWidget(
                  size: body,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: theme.tertiaryContainer,
                  val: 'Click here for a',
                ),
                SizedBox(height: 10.h),
                TextWidget(
                  size: large,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: theme.tertiaryContainer,
                  val: 'Free 1 Hour Consultation Now',
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          SvgPicture.asset('assets/img/arrow-diagonal.svg'),
        ],
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.symmetric(horizontal: 12),
    //   decoration: BoxDecoration(
    //     color: color,
    //     borderRadius: BorderRadius.circular(16),
    //     boxShadow: const [
    //       BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
    //     ],
    //   ),
    //   child: Center(
    //     child: Text(
    //       title,
    //       style: const TextStyle(
    //         fontSize: 24,
    //         color: Colors.white,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    // );
  }
}

// The carousel + indicator widget
class CustomCardCarouselWithIndicator extends StatefulWidget {
  const CustomCardCarouselWithIndicator({super.key});

  @override
  State<CustomCardCarouselWithIndicator> createState() =>
      _CustomCardCarouselWithIndicatorState();
}

class _CustomCardCarouselWithIndicatorState
    extends State<CustomCardCarouselWithIndicator> {
  final PageController _controller = PageController(initialPage: 1000);
  Timer? _timer;
  int _currentRealIndex = 0;

  final List<MyCustomCard> _cards = const [
    MyCustomCard(title: "Card 1", color: Colors.blue),
    MyCustomCard(title: "Card 2", color: Colors.green),
    MyCustomCard(title: "Card 3", color: Colors.deepOrange),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(
          height: 135.h,
          width: MediaQuery.of(context).size.width - 20,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentRealIndex = page % _cards.length;
              });
            },
            itemBuilder: (context, index) {
              final realIndex = index % _cards.length;
              return _cards[realIndex];
            },
          ),
        ),

        SizedBox(height: 10.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_cards.length, (i) {
            final bool isActive = i == _currentRealIndex;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              width: 40.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: isActive ? theme.secondaryContainer : theme.tertiary,
                borderRadius: BorderRadius.circular(1.5),
              ),
            );
          }),
        ),
      ],
    );
  }
}
