import 'package:crescent_care/utils/navbar.dart';
import 'package:crescent_care/views/activities/bmicalculator/genderselection.dart';
import 'package:crescent_care/views/activities/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: theme.tertiaryContainer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),
              SizedBox(height: 10.h),
              // Options(), // options page contains all the activities
              ageGender(), // age and gender selection for BMI calculator
              Navbar(),
            ],
          ),
        ),
      ),
    );
  }
}
