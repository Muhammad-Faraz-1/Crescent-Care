// ignore_for_file: must_be_immutable

import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/memberlogin/utilization/policypopup.dart';
import 'package:crescent_care/views/memberlogin/utilization/utilization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Utilizationpage extends StatelessWidget {
  const Utilizationpage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const PolicyPopupWidget(),
                  );
                },
                child: Row(
                  children: [
                    TextWidget(
                      size: body,
                      fontWeight: semiBold,
                      lineheight: linesmall,
                      color: theme.primary,
                      val: 'Policy:',
                    ),
                    SizedBox(width: 10.w),
                    TextWidget(
                      size: medium,
                      fontWeight: mediumWeight,
                      lineheight: linesmall,
                      color: Color(0xff757575),
                      val:
                          provider.currentpolicy == 1
                              ? 'Parents  Hospitalization'
                              : provider.currentpolicy == 2
                              ? 'Family Hospitalization '
                              : 'Out-Patient',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              utilizationlimit(label: 'Limit', value: '1,200,000'),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: utilizationlimit(
                      label: 'Utilization',
                      value: '150,000',
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: utilizationlimit(label: 'Balance', value: '1,050,000'),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              IndividualUtilizationCard(
                name: 'Muhammad Zuhair Haider',
                limitAmount: '3000',
                utilizationAmount: '2000',
                balanceAmount: '1000',
              ),
              SizedBox(height: 10.h),
              IndividualUtilizationCard(
                name: 'Syed Rabab Raza',
                limitAmount: '3000',
                utilizationAmount: '00',
                balanceAmount: '3000',
              ),
              SizedBox(height: 10.h),
              IndividualUtilizationCard(
                name: 'Muhammad Zuhair Haider',
                limitAmount: '3000',
                utilizationAmount: '2500',
                balanceAmount: '500',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class utilizationlimit extends StatelessWidget {
  String? label;
  String? value;
  utilizationlimit({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 75.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: theme.primaryContainer, // box-offwhite
        border: Border.all(color: theme.tertiary), // border
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // "Limit" Label
          SizedBox(
            width: 310.w,
            child: Text(
              label!,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontFamily: 'Poppins',
                color: Color(0xFF6962BB), // primary
              ),
            ),
          ),
          SizedBox(height: 5.h),
          // Amount
          SizedBox(
            width: 310.w,
            child: Text(
              'Rs ${value!}',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                height: 1.2,
                fontFamily: 'Poppins',
                color: Color(0xFF6962BB), // primary
              ),
            ),
          ),
        ],
      ),
    );
  }
}
