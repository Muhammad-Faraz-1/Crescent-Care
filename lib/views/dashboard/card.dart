import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            gradient: LinearGradient(colors: [theme.onTertiary, theme.primary]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 83.w,
                child: Image.asset('assets/img/bp-check.png'),
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.sp),
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
                        lineheight: lineMedium,
                        color: theme.tertiaryContainer,
                        val: 'Free 1 Hour Consultation Now',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              SvgPicture.asset('assets/img/arrow-diagonal.svg'),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 3.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: theme.secondaryContainer,
              ),
            ),
            SizedBox(width: 5.w),
            Container(
              height: 3.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: theme.onTertiary,
              ),
            ),
            SizedBox(width: 5.w),
            Container(
              height: 3.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: theme.onTertiary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
