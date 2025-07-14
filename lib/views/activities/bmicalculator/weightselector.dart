import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WeightSelector extends StatelessWidget {
  const WeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    final theme = Theme.of(context).colorScheme;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   provider.restoreWeightSelection();
    // });

    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 90.h,
                width: double.infinity,
                child: PageView.builder(
                  controller: provider.weightPageController,
                  itemCount: provider.weightList.length,
                  onPageChanged: (index) {
                    provider.setSelectedWeightIndex(index);
                  },
                  itemBuilder: (context, index) {
                    final isSelected = index == provider.selectedWeightIndex;
                    return Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 200.w,
                        height: isSelected ? 60.h : 50.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? theme.tertiaryContainer
                                  : theme.tertiary,
                          borderRadius: BorderRadius.circular(12.r),
                          border:
                              isSelected
                                  ? Border.all(color: theme.primary, width: 2)
                                  : null,
                          boxShadow:
                              isSelected
                                  ? [
                                    BoxShadow(
                                      color: theme.shadow.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ]
                                  : [],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          provider.weightList[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: isSelected ? semiBold : regular,
                            color: isSelected ? theme.primary : theme.secondary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Left triangle
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 95.w,
                bottom: 0,
                child: const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.red,
                  size: 30,
                ),
              ),

              // Right triangle
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 95.w,
                top: 0,
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),

          // Ruler-like lines
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: SizedBox(
              height: 20.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(50, (index) {
                  final isTall = index % 5 == 3;
                  return Container(
                    width: 1.5.w,
                    height: isTall ? 20.h : 10.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    decoration: BoxDecoration(
                      color:
                          isTall
                              ? theme.shadow.withOpacity(0.3)
                              : theme.secondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(1.r),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
