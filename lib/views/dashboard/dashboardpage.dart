import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/utils/sliders.dart';
import 'package:crescent_care/views/dashboard/consult.dart';
import 'package:crescent_care/views/dashboard/grid.dart';
import 'package:crescent_care/utils/helpsection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: theme.tertiaryContainer,
                border: Border(
                  bottom: BorderSide(color: theme.tertiary, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/img/drawer.svg'),
                      SizedBox(width: 10),
                      TextWidget(
                        size: medium,
                        fontWeight: mediumWeight,
                        lineheight: lineMedium,
                        color: theme.secondary,
                        val: 'Dashboard',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/img/search.svg'),
                      SizedBox(width: 10),
                      SvgPicture.asset('assets/img/bell.svg'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              color: theme.secondaryContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 29.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.sp,
                            horizontal: 10.sp,
                          ),
                          decoration: BoxDecoration(
                            color: theme.tertiaryContainer,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: TextWidget(
                              size: small,
                              fontWeight: mediumWeight,
                              lineheight: lineMedium,
                              color: theme.secondaryContainer,
                              val: '3',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.sp),
                            decoration: BoxDecoration(
                              color: theme.onTertiary,
                              borderRadius: BorderRadius.circular(2.sp),
                            ),
                            child: Center(
                              child: TextWidget(
                                size: extra_small,
                                fontWeight: mediumWeight,
                                lineheight: lineMedium,
                                color: theme.tertiaryContainer,
                                val: 'Scan',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextWidget(
                      size: body,
                      fontWeight: mediumWeight,
                      lineheight: linesmall,
                      color: theme.tertiaryContainer,
                      val: 'Start your free trail to avail out free scan',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.sp,
                      vertical: 5.sp,
                    ),
                    decoration: BoxDecoration(
                      color: theme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: TextWidget(
                        size: small,
                        fontWeight: semiBold,
                        lineheight: lineMedium,
                        color: theme.secondaryContainer,
                        val: 'Try Now',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            // ///////////////////////////////////////
            // SliderCard(),
            CustomCardCarouselWithIndicator(),
            SizedBox(height: 20.h),
            // //////////////////////////////////////
            SectionsGrid(),
            SizedBox(height: 20.h),
            // //////////////////////////////////////
            Container(
              width: 320.w,
              // height: 100.h,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(
                  colors: [theme.onTertiary, theme.primary],
                ),
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
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          width: 65.w,
                          child: Image.asset('assets/img/bp-check.png'),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: TextWidget(
                            size: medium,
                            fontWeight: semiBold,
                            lineheight: linesmall,
                            color: theme.primary,
                            val: 'Reduce your Sugar/Blood Pressure',
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
                          val: 'Trusted by over 12,000 subscribers',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // /////////////////////////////////////////////
            Consultsection(),
            // ////////////////////////////////////////////
            SizedBox(height: 20.h),
            // ////////////////////////////////////////////
            Helpsection(),
            
          ],
        ),
      ),
    );
  }
}
