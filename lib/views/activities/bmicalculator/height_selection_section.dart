import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/activities/bmicalculator/heightselector.dart';
import 'package:crescent_care/views/activities/bmicalculator/heightunit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class height_selection_section extends StatelessWidget {
  const height_selection_section({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        height: 100.h,
        width: double.infinity,
        color: theme.tertiaryContainer,
        padding: EdgeInsets.only(left: 20.w, top: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              size: medium,
              fontWeight: mediumWeight,
              lineheight: linesmall,
              color: theme.secondary,
              val: 'Select Your Height',
            ),
            SizedBox(height: 10.h),
            Center(child: Heightunit()),
            SizedBox(height: 10.h),
            TextWidget(
              size: body,
              fontWeight: mediumWeight,
              lineheight: linesmall,
              color: theme.secondary,
              val: 'Scroll to select your height',
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 320.h,
                    child: Image.asset('assets/img/boy.png'),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 320.h,
                    width: 110.w,
                    child: HeightSelector(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  provider.saveSelectedHeightValue();
                  provider.bmistepsforward(2);
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
