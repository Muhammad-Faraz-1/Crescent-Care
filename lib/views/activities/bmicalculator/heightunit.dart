import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heightunit extends StatelessWidget {
  const Heightunit({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 250.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: theme.primaryContainer,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: theme.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: TextWidget(
                  size: body,
                  fontWeight: semiBold,
                  lineheight: lineMedium,
                  color: theme.tertiaryContainer,
                  val: 'Feet',
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  // color: theme.primaryContainer,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: TextWidget(
                  size: body,
                  fontWeight: mediumWeight,
                  lineheight: lineMedium,
                  color: theme.secondary,
                  val: 'Meters',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
