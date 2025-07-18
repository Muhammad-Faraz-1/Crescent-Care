import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/utils/navbar.dart';
import 'package:crescent_care/views/memberlogin/claims/claimspage.dart';
import 'package:crescent_care/views/memberlogin/dashboard/members_dashboard.dart';
import 'package:crescent_care/views/memberlogin/profile/profilepage.dart';
import 'package:crescent_care/views/memberlogin/tabbar.dart';
import 'package:crescent_care/views/memberlogin/utilization/utilizationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Memberspage extends StatelessWidget {
  const Memberspage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 20.h,
                    ),
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
                                flipX: true,
                                child: SvgPicture.asset(
                                  'assets/img/arrow-right.svg',
                                  colorFilter: ColorFilter.mode(
                                    theme.secondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
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
                  SizedBox(height: 10.h),
                  provider.selected == 1
                      ? MembersDashboard()
                      : provider.selected == 2
                      ? Profilepage()
                      : provider.selected == 3
                      ? Utilizationpage()
                      : Expanded(child: Claimspage()),
                      SizedBox(height: 70,)
                ],
              ),
            ),
            Positioned(bottom: 0, child: Navbar()),
          ],
        ),
      ),
    );
  }
}
