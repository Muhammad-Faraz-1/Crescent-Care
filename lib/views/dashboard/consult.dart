import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Consultsection extends StatelessWidget {
  const Consultsection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: theme.onTertiary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            size: medium,
            fontWeight: mediumWeight,
            lineheight: linesmall,
            color: theme.secondaryContainer,
            val: 'Not Feeling Well?',
          ),
          SizedBox(height: 10.h),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 13.w,
            runSpacing: 10.h,
            children: [
              Problems(img: 'fever', val: 'Fever'),
              Problems(img: 'bp', val: 'BP'),
              Problems(img: 'child', val: 'Child Care'),
              Problems(img: 'cholestrol', val: 'Cholestrol'),
              Problems(img: 'gynae', val: 'Gynae'),
              Problems(img: 'skin', val: 'Skin'),
              Problems(img: 'sugar', val: 'Diabetes'),
              Problems(img: 'depress', val: 'Depression'),
            ],
          ),
          SizedBox(height: 20.h),
          Center(
            child: Container(
              width: 280.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: theme.secondaryContainer,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: TextWidget(
                  size: medium,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: theme.tertiaryContainer,
                  val: 'Video call a Doctor',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Problems extends StatelessWidget {
  String? img;
  String? val;
  Problems({super.key, required this.img, required this.val});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 70.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
          child: Image.asset('assets/img/${img!}.png'),
        ),
        SizedBox(height: 5.h),
        TextWidget(
          size: small,
          fontWeight: mediumWeight,
          lineheight: linesmall,
          color: theme.secondaryContainer,
          val: val,
        ),
      ],
    );
  }
}
