import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/login_page/login.dart';
// import 'package:crescent_care/views/login_page/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final AnimationController _scaleController;
  late final AnimationController _boxController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _boxSlideAnimation;

  bool showBox = false;
  bool showAuthContainer = false;
  bool isSignup = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _boxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _boxSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _boxController, curve: Curves.easeOutCubic),
    );

    _slideController.forward().whenComplete(() {
      _scaleController.repeat(reverse: true);

      Future.delayed(const Duration(seconds: 5), () {
        _scaleController.stop();
        setState(() => showBox = true);
        _boxController.forward();
      });
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _scaleController.dispose();
    _boxController.dispose();
    // emailController.dispose();
    // passwordController.dispose();
    // confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.primary,
      body: Stack(
        children: [
          Positioned(top: height * 0.1, left: -60, child: _buildCircle(200)),
          Positioned(top: height * 0.6, right: -80, child: _buildCircle(160)),
          Positioned(bottom: height * 0.2, left: -40, child: _buildCircle(120)),
          Positioned(bottom: height * 0.1, right: 80, child: _buildCircle(80)),

          if (!showAuthContainer)
            Center(
              child: SlideTransition(
                position: _slideAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/img/logo.png',
                        width: 140.w,
                        height: 140.h,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Crescent Care',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          if (showBox)
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _boxSlideAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    // margin: EdgeInsets.symmetric(horizontal: 20.w),
                    // padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child:
                        !showAuthContainer
                            ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextWidget(
                                      size: medium,
                                      fontWeight: mediumWeight,
                                      lineheight: lineMedium,
                                      color: theme.onSecondary,
                                      val: 'Login As',
                                    ),
                                  ),

                                  SizedBox(height: 20.h),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Colors.transparent,
                                        builder:
                                            (_) => Padding(
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    MediaQuery.of(
                                                      context,
                                                    ).viewInsets.bottom,
                                              ),
                                              child: LoginSignupPopup(),
                                            ),
                                      );
                                    },
                                    child: Container(
                                      height: 45.h,
                                      width: 260.w,
                                      decoration: BoxDecoration(
                                        color: theme.secondaryContainer,
                                        borderRadius: BorderRadius.circular(
                                          30.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: TextWidget(
                                          size: medium,
                                          fontWeight: mediumWeight,
                                          lineheight: lineMedium,
                                          color: theme.tertiaryContainer,
                                          val: 'Individual',
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: () {
                                      // showGeneralDialog(
                                      //   context: context,
                                      //   barrierDismissible: true,
                                      //   barrierLabel: "Popup",
                                      //   barrierColor: Colors.black54,
                                      //   transitionDuration: Duration(
                                      //     milliseconds: 400,
                                      //   ),
                                      //   pageBuilder: (context, anim1, anim2) {
                                      //     return Align(
                                      //       alignment: Alignment.center,
                                      //       child: CorporatePopup(),
                                      //     );
                                      //   },
                                      //   transitionBuilder: (
                                      //     context,
                                      //     anim1,
                                      //     anim2,
                                      //     child,
                                      //   ) {
                                      //     final offsetTween = Tween<Offset>(
                                      //       begin: Offset(0, -1),
                                      //       end: Offset.zero,
                                      //     );
                                      //     return SlideTransition(
                                      //       position: offsetTween.animate(
                                      //         CurvedAnimation(
                                      //           parent: anim1,
                                      //           curve: Curves.easeOut,
                                      //         ),
                                      //       ),
                                      //       child: FadeTransition(
                                      //         opacity: anim1,
                                      //         child: child,
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: Container(
                                      height: 45.h,
                                      width: 260.w,
                                      decoration: BoxDecoration(
                                        // color: theme.secondaryContainer,
                                        borderRadius: BorderRadius.circular(
                                          30.r,
                                        ),
                                        border: Border.all(
                                          color: theme.secondaryContainer,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: TextWidget(
                                          size: medium,
                                          fontWeight: mediumWeight,
                                          lineheight: lineMedium,
                                          color: theme.secondaryContainer,
                                          val: 'Corporate',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : Stack(
                              children: [
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: GestureDetector(
                                    onTap:
                                        () => setState(
                                          () => showAuthContainer = false,
                                        ),
                                    child: SvgPicture.asset(
                                      'assets/img/arrow-back.svg',
                                      width: 40.w,
                                      height: 40.h,
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 20.h),
                                //   child: _buildAuthSection(),
                                // ),
                              ],
                            ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCircle(double size) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.15),
      ),
    );
  }
}
