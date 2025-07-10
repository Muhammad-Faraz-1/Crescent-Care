import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double extra_small = 8;
double small = 10;
double body = 12;
double medium = 15;
double large = 18;
double extra_large = 25;
double big = 45;

FontWeight regular = FontWeight.w400;
FontWeight mediumWeight = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

double linesmall = 1.2;
double lineMedium = 1.5;

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  double? size;
  FontWeight? fontWeight;
  double? lineheight;
  Color? color;
  String? val;

  TextWidget({
    super.key,
    required this.size,
    required this.fontWeight,
    required this.lineheight,
    required this.color,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      val!,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: size?.sp,
        fontWeight: fontWeight,
        height: lineheight,
        color: color,
      ),
    );
  }
}
