import 'dart:ui';

import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    final ageList = provider.ageList;
    final selectedIndex = provider.selectedAgeIndex;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 90.h,
              width: MediaQuery.of(context).size.width - 40.w,
              child: PageView.builder(
                controller: provider.agePageController,
                itemCount: ageList.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 60.w,
                      height: isSelected ? 60.h : 50.h,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(
                        color: isSelected ? theme.tertiaryContainer : theme.tertiary,
                        borderRadius: BorderRadius.circular(12.r),
                        border: isSelected
                            ? Border.all(
                                color: theme.primary, width: 2)
                            : null,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: theme.shadow.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ageList[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: isSelected
                              ? semiBold
                              : FontWeight.normal,
                          color: isSelected ? theme.primary : theme.secondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 0,
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}