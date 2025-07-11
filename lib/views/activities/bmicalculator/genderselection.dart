import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/activities/bmicalculator/age-selector.dart';
import 'package:crescent_care/views/activities/bmicalculator/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ageGender extends StatelessWidget {
  const ageGender({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              size: medium,
              fontWeight: semiBold,
              lineheight: lineMedium,
              color: theme.secondary,
              val: 'Select Your Gender',
            ),
            GenderSelector(),
            SizedBox(height: 20.h),
            TextWidget(
              size: medium,
              fontWeight: semiBold,
              lineheight: lineMedium,
              color: theme.secondary,
              val: 'Select Your Age',
            ),
            SizedBox(height: 10.h),
            TextWidget(
              size: body,
              fontWeight: mediumWeight,
              lineheight: lineMedium,
              color: theme.secondary,
              val: 'Scroll to select your age',
            ),
            AgeSelector(),
          ],
        ),
      ),
    );
  }
}
