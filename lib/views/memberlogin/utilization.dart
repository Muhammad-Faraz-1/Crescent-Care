// ignore_for_file: must_be_immutable

import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/memberlogin/donut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LimitCard extends StatelessWidget {
  String? name;
  String? limit;
  double? Val;
  LimitCard({
    super.key,
    required this.Val,
    required this.limit,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 320.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA), // off-white
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF0F0F0)), // border color
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF535353), // dark grey
                  fontFamily: 'Poppins',
                ),
              ),
              // Value
              Text(
                limit!,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6962BB), // primary
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          // Donut chart
          Positioned(
            top: 10,
            right: 10,
            child: DonutProgressIndicator(
              percentage: Val!,
              size: 60,
              strokeWidth: 6,
              backgroundColor: theme.onTertiary, // support
              fillColor: theme.primary, // primary
            ),
          ),
        ],
      ),
    );
  }
}

class Utilization extends StatelessWidget {
  const Utilization({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          size: medium,
          fontWeight: mediumWeight,
          lineheight: linesmall,
          color: theme.secondary,
          val: 'Utilization',
        ),
        SizedBox(height: 20.h),
        LimitCard(
          Val: 0.5,
          limit: 'Rs 150,000',
          name: 'Family Hospitalization',
        ),
        SizedBox(height: 10.h),
        LimitCard(
          Val: 0.3,
          limit: 'Rs 100,000',
          name: 'Parent\'s Hospitalization',
        ),
        SizedBox(height: 10.h),
        LimitCard(Val: 0.8, limit: 'Rs 2,000', name: 'Out Pateint Department'),
      ],
    );
  }
}

class UtilizationCard extends StatelessWidget {
  const UtilizationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 320.w,
      // height: 107.h,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF8685CF), Color(0xFF6962BB)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Utilization',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 17.h),
                Row(
                  children: [
                    // Limit
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              children: [
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Limit',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Dashed divider
                    SizedBox(width: 10.w),
                    SizedBox(
                      height: 43.h,
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        width: 38,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    // Balance
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xFFA79BD8),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              children: [
                                Text(
                                  '70%',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Balance',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          DonutProgressIndicator(
            percentage: 0.2,
            backgroundColor: theme.tertiaryContainer,
            fillColor: theme.onTertiary,
            seperate: true,
          ),
        ],
      ),
    );
  }
}
