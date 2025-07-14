import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/activities/bmicalculator/weightselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Weight_calculation extends StatelessWidget {
  const Weight_calculation({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              size: medium,
              fontWeight: mediumWeight,
              lineheight: linesmall,
              color: theme.secondary,
              val: 'Select Your weight',
            ),
            // SizedBox(height: 10.h),
            // Center(child: Heightunit()),
            SizedBox(height: 10.h),
            TextWidget(
              size: body,
              fontWeight: mediumWeight,
              lineheight: linesmall,
              color: theme.secondary,
              val: 'Scroll to select your weight',
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                height: 320.h,
                width: 200.w,
                child: WeightSelector(),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: GestureDetector(
                onTap:
                    () => {
                      provider.bmistepsforward(3),
                      provider.saveSelectedWeightValue(),
                    },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.tertiaryContainer,
                    border: Border.all(color: theme.primary, width: 2),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/img/arrow-left.svg',
                      colorFilter: ColorFilter.mode(
                        theme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
