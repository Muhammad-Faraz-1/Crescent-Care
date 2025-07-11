import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/dashboard/help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Helpsection extends StatelessWidget {
  const Helpsection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          width: 320.w,
          // height: 100.h,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(colors: [theme.onTertiary, theme.primary]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 90.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: theme.tertiaryContainer,
                ),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      width: 65.w,
                      child: Image.asset('assets/img/scan.png'),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: TextWidget(
                        size: medium,
                        fontWeight: semiBold,
                        lineheight: linesmall,
                        color: theme.primary,
                        val: 'Learn how our scan technology works',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset('assets/img/arrow-right.svg'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/check-r.png', height: 18.h),
                    SizedBox(width: 10.w),
                    TextWidget(
                      size: small,
                      fontWeight: mediumWeight,
                      lineheight: linesmall,
                      color: theme.tertiaryContainer,
                      val: 'Trusted by Medical Professionals',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        HelpButton(),
        SizedBox(height: 90.h),
      ],
    );
  }
}
