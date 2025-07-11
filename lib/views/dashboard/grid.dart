import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/activities/activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionsGrid extends StatelessWidget {
  const SectionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130.w,
              height: 210.h,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(
                  colors: [theme.onTertiary, theme.primary],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: theme.tertiaryContainer,
                ),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      size: medium,
                      fontWeight: semiBold,
                      lineheight: linesmall,
                      color: theme.primary,
                      val: 'Member\'s Login',
                    ),
                    Image.asset('assets/img/member.png', fit: BoxFit.contain),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              children: [
                Container(
                  width: 180.w,
                  height: 100.h,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: LinearGradient(
                      colors: [theme.onTertiary, theme.primary],
                    ),
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: theme.tertiaryContainer,
                    ),
                    // padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: TextWidget(
                            size: medium,
                            fontWeight: semiBold,
                            lineheight: linesmall,
                            color: theme.primary,
                            val: 'In Patients',
                          ),
                        ),
                        Image.asset(
                          'assets/img/in-patient.png',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 180.w,
                  height: 100.h,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: LinearGradient(
                      colors: [theme.onTertiary, theme.primary],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: theme.tertiaryContainer,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: TextWidget(
                            size: medium,
                            fontWeight: semiBold,
                            lineheight: linesmall,
                            color: theme.primary,
                            val: 'Out Patients',
                          ),
                        ),
                        Image.asset(
                          'assets/img/outpateint.png',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Activities(),
              ),
            );
          },
          child: Container(
            width: 320.w,
            height: 100.h,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                colors: [theme.onTertiary, theme.primary],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: theme.tertiaryContainer,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: TextWidget(
                      size: medium,
                      fontWeight: semiBold,
                      lineheight: linesmall,
                      color: theme.primary,
                      val: 'Activities',
                    ),
                  ),
                  Image.asset('assets/img/activities.png', fit: BoxFit.contain),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
