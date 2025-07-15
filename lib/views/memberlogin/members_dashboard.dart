import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/utils/navbar.dart';
import 'package:crescent_care/views/memberlogin/chart.dart';
import 'package:crescent_care/views/memberlogin/claimcard.dart';
import 'package:crescent_care/views/memberlogin/claims.dart';
import 'package:crescent_care/views/memberlogin/membercards.dart';
import 'package:crescent_care/views/memberlogin/tabbar.dart';
import 'package:crescent_care/views/memberlogin/utilization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MembersDashboard extends StatelessWidget {
  const MembersDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: theme.tertiaryContainer,
          child: Stack(
            children: [
              
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    decoration: BoxDecoration(
                      color: theme.tertiaryContainer,
                      border: Border(
                        bottom: BorderSide(color: theme.tertiary, width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Transform.flip(
                                child: SvgPicture.asset(
                                  'assets/img/arrow-right.svg',
                                  colorFilter: ColorFilter.mode(
                                    theme.secondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                flipX: true,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            TextWidget(
                              size: medium,
                              fontWeight: mediumWeight,
                              lineheight: lineMedium,
                              color: theme.secondary,
                              val: 'Member\'s Login',
                            ),
                          ],
                        ),
                        SvgPicture.asset('assets/img/bell.svg'),
                      ],
                    ),
                  ),
                  HorizontalTabBar(),
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                           Membercards(),
                            //
                            SizedBox(height: 20.h),
                            Utilization(),
                            //
                            SizedBox(height: 20.h),
                            Activity(),
                            //
                            SizedBox(height: 20.h),
                            UtilizationCard(),
                            //
                            SizedBox(height: 20.h),
                            ClaimDetailsCard(),
                            //
                            SizedBox(height: 20.h),
                            RecentClaims(),
                            SizedBox(height: 100.h,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Navbar()),
            ],
          ),
        ),
      ),
    );
  }
}
