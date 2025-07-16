import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UtilizationDetailPopup extends StatelessWidget {
  // final String name;
  // final String gender;
  // final String relation;
  // final int age;
  // final String memberCode;
  // final String limit;
  // final String utilization;
  // final String balance;

  const UtilizationDetailPopup({
    super.key,
    // required this.name,
    // required this.gender,
    // required this.relation,
    // required this.age,
    // required this.memberCode,
    // required this.limit,
    // required this.utilization,
    // required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    double width = MediaQuery.of(context).size.width - 20;

    return Dialog(
      insetPadding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.primaryContainer,
          border: Border.all(color: theme.tertiary),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleText('Muhammad Zuhair Haider'),
            SizedBox(height: 10.h),
            Row(
              children: [
                _infoBox(title: "Limit", value: '3000'),
                SizedBox(width: 5.w),
                _infoBox(title: "Utilization", value: '2000'),
                SizedBox(width: 5.w),
                _infoBox(title: "Balance", value: '1000'),
              ],
            ),
             SizedBox(height: 10.h),
            _infoRow("Gender", 'Male'),
            _infoRow("Relation", 'Self'),
            _infoRow("Age", "35"),
            _infoRow("Member Code", 'SMCHSMDP00001/23'),
          ],
        ),
      ),
    );
  }

  Widget _titleText(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: Color(0xFF757575),
      fontFamily: 'Poppins',
    ),
  );

  Widget _infoBox({required String title, required String value}) {
    return Expanded(
      child: Container(
        height: 70.h,
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8685CF), Color(0xFF6962BB)],
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Rs ${value}',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              label,
              style:  TextStyle(
                fontSize: 10.sp,
                color: Color(0xFF757575),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ),
           SizedBox(width: 30.w),
          Expanded(
            child: Text(
              value,
              style:  TextStyle(
                fontSize: 12.sp,
                color: Color(0xFF6962BB),
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
