import 'package:crescent_care/main.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

enum FormStage { login, signupStep1, signupStep2 }

class LoginSignupPopup extends StatefulWidget {
  @override
  _LoginSignupPopupState createState() => _LoginSignupPopupState();
}

class _LoginSignupPopupState extends State<LoginSignupPopup> {
  Future<void> openWebsite() async {
    final Uri url = Uri.parse('https://zellesolutions.com/');
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // opens in browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  FormStage _currentStage = FormStage.login;

  void goToStage(FormStage stage) {
    setState(() => _currentStage = stage);
  }

  bool get isLogin => _currentStage == FormStage.login;
  bool get isSignupStep1 => _currentStage == FormStage.signupStep1;
  bool get isSignupStep2 => _currentStage == FormStage.signupStep2;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
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
          children: [_buildHeader(), _buildFormSection(), _buildFooter()],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
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
    );
  }

  Widget _buildFormSection() {
    return Column(
      children: [
        _buildToggleButtons(),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            final offsetAnim = Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ).animate(animation);
            return SlideTransition(position: offsetAnim, child: child);
          },
          child: _buildForm(),
        ),
      ],
    );
  }

  Widget _buildToggleButtons() {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: theme.secondaryContainer),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            _buildToggleButton("Login", isLogin),
            _buildToggleButton("Signup", !isLogin),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (label == "Login") {
            goToStage(FormStage.login);
          } else {
            goToStage(FormStage.signupStep1);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? theme.secondaryContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : theme.secondaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    if (isLogin) return _buildLoginForm();
    if (isSignupStep1) return _buildSignupStep1();
    return _buildSignupStep2();
  }

  Widget _buildLoginForm() {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      key: ValueKey("login"),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                size: medium,
                fontWeight: mediumWeight,
                lineheight: linesmall,
                color: theme.secondary,
                val: 'Email',
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
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  hintText: "Email",
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
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                size: medium,
                fontWeight: mediumWeight,
                lineheight: linesmall,
                color: theme.secondary,
                val: 'Password',
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
                // validator: (value) {
                //   if (value == null || value.isEmpty)
                //     return 'Email is required';
                //   if (!value.contains('@')) return 'Enter a valid email';
                //   return null;
                // },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  hintText: "Password",
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
                obscureText: true,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgotten Password",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: small,
                    fontWeight: mediumWeight,
                    height: linesmall,
                    color: theme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              // child: TextButton(
              //   onPressed: () {},
              //   child: Text("Forgotten Password",style: TextStyle(fontFamily: 'Poppins',fontSize: small,fontWeight: mediumWeight,height: linesmall,color: theme.primary,decoration: TextDecoration.underline),),
              // ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => bodyapp(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: theme.secondaryContainer,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: theme.tertiaryContainer,
                fontSize: 15.sp,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupStep1() {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      key: ValueKey("signup1"),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                size: medium,
                fontWeight: mediumWeight,
                lineheight: linesmall,
                color: theme.secondary,
                val: 'Email',
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
                // validator: (value) {
                //   if (value == null || value.isEmpty)
                //     return 'Email is required';
                //   if (!value.contains('@')) return 'Enter a valid email';
                //   return null;
                // },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  hintText: "Email",
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
          ),
          SizedBox(height: 20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                size: medium,
                fontWeight: mediumWeight,
                lineheight: linesmall,
                color: theme.secondary,
                val: 'Password',
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
                // validator: (value) {
                //   if (value == null || value.isEmpty)
                //     return 'Email is required';
                //   if (!value.contains('@')) return 'Enter a valid email';
                //   return null;
                // },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  hintText: "Password",
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
                obscureText: true,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                size: medium,
                fontWeight: mediumWeight,
                lineheight: linesmall,
                color: theme.secondary,
                val: 'Confirm Password',
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
                // validator: (value) {
                //   if (value == null || value.isEmpty)
                //     return 'Email is required';
                //   if (!value.contains('@')) return 'Enter a valid email';
                //   return null;
                // },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  hintText: "Confirm Password",
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
                obscureText: true,
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => goToStage(FormStage.signupStep2),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.secondaryContainer,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: theme.tertiaryContainer,
                fontSize: 15.sp,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupStep2() {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      key: ValueKey("signup2"),
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        size: medium,
                        fontWeight: mediumWeight,
                        lineheight: linesmall,
                        color: theme.secondary,
                        val: 'First Name',
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty)
                        //     return 'Email is required';
                        //   if (!value.contains('@')) return 'Enter a valid email';
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          hintText: "First Name",
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
                            borderSide: BorderSide(
                              color: Color(0xfff0f0f0),
                              width: 1,
                            ),
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
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        size: medium,
                        fontWeight: mediumWeight,
                        lineheight: linesmall,
                        color: theme.secondary,
                        val: 'Last Name',
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty)
                        //     return 'Email is required';
                        //   if (!value.contains('@')) return 'Enter a valid email';
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          hintText: "Last Name",
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
                            borderSide: BorderSide(
                              color: Color(0xfff0f0f0),
                              width: 1,
                            ),
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  size: medium,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: theme.secondary,
                  val: 'User Name',
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty)
                  //     return 'Email is required';
                  //   if (!value.contains('@')) return 'Enter a valid email';
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    hintText: "User Name",
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
                      borderSide: BorderSide(
                        color: Color(0xfff0f0f0),
                        width: 1,
                      ),
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
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        size: medium,
                        fontWeight: mediumWeight,
                        lineheight: linesmall,
                        color: theme.secondary,
                        val: 'Gender',
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty)
                        //     return 'Email is required';
                        //   if (!value.contains('@')) return 'Enter a valid email';
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          hintText: "Gender",
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
                            borderSide: BorderSide(
                              color: Color(0xfff0f0f0),
                              width: 1,
                            ),
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
                  ),
                ),
                SizedBox(width: 10.h),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        size: medium,
                        fontWeight: mediumWeight,
                        lineheight: linesmall,
                        color: theme.secondary,
                        val: 'Contact',
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty)
                        //     return 'Email is required';
                        //   if (!value.contains('@')) return 'Enter a valid email';
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          hintText: "Contact",
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
                            borderSide: BorderSide(
                              color: Color(0xfff0f0f0),
                              width: 1,
                            ),
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  size: medium,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: theme.secondary,
                  val: 'Date of Birth',
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty)
                  //     return 'Email is required';
                  //   if (!value.contains('@')) return 'Enter a valid email';
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    hintText: "Date of Birth",
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
                      borderSide: BorderSide(
                        color: Color(0xfff0f0f0),
                        width: 1,
                      ),
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
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => bodyapp(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.secondaryContainer,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: theme.tertiaryContainer,
                  fontSize: 15.sp,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
                width: 30.w,
                child: Image.asset('assets/img/zelle.png'),
              ),
              // Icon(Icons.chat_bubble, color: Colors.blue),
              SizedBox(width: 10),
              Text("Powered by ", style: TextStyle(fontSize: 14)),
              GestureDetector(
                onTap: () {
                  openWebsite();
                },
                child: Text(
                  "Zelle Solutions Pvt. Ltd.",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
