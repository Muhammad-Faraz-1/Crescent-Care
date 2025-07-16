import 'package:crescent_care/views/memberlogin/dashboard/chart.dart';
import 'package:crescent_care/views/memberlogin/dashboard/claimcard.dart';
import 'package:crescent_care/views/memberlogin/dashboard/claims.dart';
import 'package:crescent_care/views/memberlogin/dashboard/membercards.dart';
import 'package:crescent_care/views/memberlogin/dashboard/utilization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembersDashboard extends StatelessWidget {
  const MembersDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
