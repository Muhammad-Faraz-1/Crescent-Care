import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HeightSelector extends StatelessWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 250.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Scrollable height values
          Positioned.fill(
            child: ListWheelScrollView.useDelegate(
              controller: provider.heightScrollController,
              itemExtent: 40.h,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                provider.setSelectedHeightIndex(index);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: provider.heightList.length,
                builder: (context, index) {
                  final isSelected = index == provider.selectedHeightIndex;
                  return Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        border: isSelected
                            ? Border.all(color: theme.primary, width: 1.5)
                            : null,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        provider.heightList[index],
                        style: TextStyle(
                          fontSize: isSelected ? 15.sp : 12.sp,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? theme.secondary : Colors.grey,
                          height: linesmall,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Left red triangle
          Positioned(
            left: 0.w,
            child: Transform.rotate(
              angle: -3.14 / 2,
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.red,
                size: 28.sp,
              ),
            ),
          ),

          // Right red triangle
          Positioned(
            right: 0.w,
            child: Transform.rotate(
              angle: 3.14 / 2,
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.red,
                size: 28.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
