import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/utils/helpsection.dart';
import 'package:crescent_care/utils/sliders.dart';
import 'package:crescent_care/views/activities/bmicalculator/bmi-calculator-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomCardCarouselWithIndicator(),
              // ////////////////////////////
              SizedBox(height: 20.h),
              // /////////////////////////////
              GestureDetector(
                onTap: () {
                  provider.toggleBmiCalculator(true);
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder:
                          (BuildContext context) => const Bmi_calculator_page(),
                    ),
                  );
                },
                child: Container(
                  width: 320.w,
                  // height: 100.h,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: LinearGradient(
                      colors: [theme.onTertiary, theme.primary],
                    ),
                  ),
                  child: Container(
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
                          child: Image.asset('assets/img/bmi-cal.png'),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: TextWidget(
                            size: large,
                            fontWeight: semiBold,
                            lineheight: linesmall,
                            color: theme.primary,
                            val: 'BMI Calculator',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // ////////////////////////////
              Container(
                width: 320.w,
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
                            child: Image.asset('assets/img/bp-cal.png'),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: TextWidget(
                              size: large,
                              fontWeight: semiBold,
                              lineheight: linesmall,
                              color: theme.primary,
                              val: 'Blood Pressure Tracker',
                            ),
                          ),
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
            ],
          ),
          // ////////////////////////////////////////////\
          Helpsection(),
        ],
      ),
    );
  }
}
