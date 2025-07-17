// ignore_for_file: must_be_immutable

import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/memberlogin/claims/addclaims.dart';
import 'package:crescent_care/views/memberlogin/claims/processedclaims.dart';
import 'package:crescent_care/views/memberlogin/claims/processpopup.dart';
import 'package:crescent_care/views/memberlogin/claims/submittedclaims.dart';
import 'package:crescent_care/views/memberlogin/claims/sumittedpop.dart';
import 'package:crescent_care/views/memberlogin/utilization/policypopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Claimspage extends StatelessWidget {
  const Claimspage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return Stack(
      children: [
        Container(
          // width: MediaQuery.of(context).size.width - 20,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  ClaimTab(id: 1, val: 'Add Claims'),
                  ClaimTab(id: 2, val: 'Submitted'),
                  ClaimTab(id: 3, val: 'Processed'),
                ],
              ),
              SizedBox(height: 20.h),
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
                      color: theme.secondary,
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
              provider.selectedclaimtab == 1
                  ? Addclaims()
                  : provider.selectedclaimtab == 2
                  ? Submittedclaims()
                  : Processedclaims(),
            ],
          ),
        ),
        AnimatedPositioned(
          bottom: provider.submitbottom,
          duration: Duration(seconds: 1),
          child: Filtersubmitted(),
        ),

         AnimatedPositioned(
          bottom: provider.processbottom,
          duration: Duration(seconds: 1),
          child: Processpopup(),
        ),
      ],
    );
  }
}

class ClaimTab extends StatelessWidget {
  int? id;
  String? val;
  ClaimTab({super.key, required this.id, required this.val});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          provider.claimtab(id!);
        },
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              provider.selectedclaimtab == id ? 4 : 0,
            ),
            color:
                provider.selectedclaimtab == id
                    ? theme.primary.withOpacity(0.2)
                    : Colors.transparent,
          ),
          child: Center(
            child: TextWidget(
              size: body,
              fontWeight:
                  provider.selectedclaimtab == id ? semiBold : mediumWeight,
              lineheight: linesmall,
              color: theme.primary,
              val: val,
            ),
          ),
        ),
      ),
    );
  }
}

class InputInfo extends StatelessWidget {
  String? label;
  InputInfo({super.key, required this.label});

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
          val: label,
        ),
        SizedBox(height: 5.h),
        TextField(
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: body,
            fontWeight: regular,
            height: linesmall,
            color: theme.onSecondary,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            hintText: label,
            filled: true,
            fillColor: Color(0xfffafafa),
            focusColor: Color(0xfff0f0f0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xfff0f0f0),
                width: 1,
              ), // Default state
              borderRadius: BorderRadius.circular(4.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff0f0f0), width: 1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xfff0f0f0),
              ), // On focus
              borderRadius: BorderRadius.circular(4.r),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xfff0f0f0),
              ), // Fallback
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
      ],
    );
  }
}
