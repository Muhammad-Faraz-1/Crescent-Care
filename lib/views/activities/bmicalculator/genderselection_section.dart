import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/activities/bmicalculator/age-selector.dart';
import 'package:crescent_care/views/activities/bmicalculator/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ageGender_section extends StatelessWidget {
  const ageGender_section({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
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
            SizedBox(height: 20.h),
            Center(
              child: GestureDetector(
                  onTap: () => provider.bmistepsforward(1),
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.tertiaryContainer,
                      border: Border.all(
                        color: theme.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/img/arrow-left.svg',
                          colorFilter: ColorFilter.mode(
                            theme.primary,
                            BlendMode.srcIn,
                          )),
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
