
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClaimCard extends StatelessWidget {
    ClaimCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 320.w,
      // height: 85.h,
      padding:  EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primaryContainer,
        border: Border.all(color: theme.tertiary),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ID + Self
              Row(
                children: [
                  // ID
                  Container(
                    width: 51,
                    alignment: Alignment.centerLeft,
                    child:   Text(
                      '00001277920',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        height: 1.5,
                        color: theme.secondary,
                      ),
                    ),
                  ),
                   SizedBox(width: 10.w),
                  // "Self" Chip
                  Container(
                    padding:   EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    decoration: BoxDecoration(
                      color:   theme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child:   Text(
                      'Self',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 1.5,
                        color: theme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              // Optional Icon/Image
              SizedBox(
                width: 16.w,
                // height: 16.h,
                child: Image.asset('assets/img/eye.png'), // update path accordingly
              ),
            ],
          ),
            SizedBox(height: 10.h),
          // Bottom Claim Row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Name + Code
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  SizedBox(
                    width: 142.w,
                    child: Text(
                      'Muhammad Zuhair Haider',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 1.2,
                        color:  theme.secondary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 142.w,
                    child: Text(
                      'SMCHSM100041/02',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        height: 1.25,
                        color:  theme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
                SizedBox(width: 10.w),
              // Claim Amount
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  Text(
                    'Claim Amount',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1.43,
                      color:  theme.onSecondary,
                    ),
                  ),
                  Text(
                    'Rs 2,000',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1.2,
                      color:  theme.secondary,
                    ),
                  ),
                ],
              ),
                Spacer(),
              // Status
              Container(
                padding:   EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color:   Color.fromRGBO(50, 168, 72, 0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child:   Text(
                  'Approved',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    height: 1.25,
                    color: Color(0xFF32A848),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class RecentClaims extends StatelessWidget {
   const RecentClaims({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          size: medium,
          fontWeight: mediumWeight,
          lineheight: linesmall,
          color: theme.secondary,
          val: 'Recent Claims',
        ),
        SizedBox(height: 10.h),
        ClaimCard(),
        SizedBox(height: 10.h),
        ClaimCard(),
        SizedBox(height: 10.h),
        ClaimCard(),
      ],
    );
  }
}