import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/views/activities/bmicalculator/bmi_result_section.dart';
import 'package:crescent_care/views/activities/bmicalculator/genderselection_section.dart';
import 'package:crescent_care/views/activities/bmicalculator/height_selection_section.dart';
import 'package:crescent_care/views/activities/bmicalculator/weight_calculation.dart';
import 'package:crescent_care/views/activities/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Bmi_calculator_page extends StatelessWidget {
  const Bmi_calculator_page({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    // final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),
              SizedBox(height: 10.h),
              provider.bmistep == 0
                  ? const ageGender_section()
                  : provider.bmistep == 1
                  ? height_selection_section()
                  : provider.bmistep == 2
                  ? const Weight_calculation()
                  : BMIResultPage(valuesToShow: ['abc','def','ghi','jkl'], finalBMI: 24.29, statusLabel: 'Overweight', perfectWeight: 60,),
            ],
          ),
        ),
      ),
    );
  }
}
