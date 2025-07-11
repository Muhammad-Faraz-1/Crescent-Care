import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        _makePhoneCall('+ 0213822273');
        // You can also use a dialog or snackbar to show the number instead of making a call
      },
      child: Container(
        width: 320.w,
        height: 70.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: theme.secondaryContainer, // dark-blue background
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 50.h,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: SvgPicture.asset('assets/img/headphone.svg'),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  size: medium,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: theme.tertiaryContainer,
                  val: 'Here to Help 24/7',
                ),
                TextWidget(
                  size: small,
                  fontWeight: regular,
                  lineheight: linesmall,
                  color: theme.tertiaryContainer,
                  val: 'Call the helpline +92 21 3822 273',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
