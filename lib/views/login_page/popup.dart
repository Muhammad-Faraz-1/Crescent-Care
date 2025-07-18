// import 'package:crescent_care/views/login_page/corporate-login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CorporatePopup extends StatelessWidget {
  const CorporatePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      // height: MediaQuery.of(context).size.height * 0.,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 70.h,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // BackButton(),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: SvgPicture.asset('assets/img/arrow-back.svg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primary,
                        boxShadow: [
                          BoxShadow(
                            color: theme.shadow.withOpacity(0.2),
                            blurRadius: 6.r,
                            spreadRadius: 0.r,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/img/logo.png',
                          width: 70.w,
                          height: 70.h,
                        ),
                      ),
                    ),
                  ), // Spacer
                ],
              ),
            ),
            // _buildFormSection(),
          ],
        ),
      ),
    );
  }
}
