import 'package:crescent_care/views/memberlogin/utilization/utilizationdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndividualUtilizationCard extends StatelessWidget {
  final String name;
  // final VoidCallback onViewDetails;
  final String limitAmount;
  final String utilizationAmount;
  final String balanceAmount;

  const IndividualUtilizationCard({
    super.key,
    required this.name,
    // required this.onViewDetails,
    required this.limitAmount,
    required this.utilizationAmount,
    required this.balanceAmount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 320.w,
      // height: 110,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primaryContainer,
        border: Border.all(color: theme.tertiary),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          // Top row: Name and View Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: 200.w,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: theme.onSecondary,
                    fontFamily: 'Poppins',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => UtilizationDetailPopup(),
                  );
                },
                child: Container(
                  height: 30.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: theme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: theme.primary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Bottom row: Limit | Utilization | Balance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _InfoCard(title: 'Limit', amount: limitAmount)),SizedBox(width: 10.w,),
              Expanded(child: _InfoCard(title: 'Utilization', amount: utilizationAmount)),SizedBox(width: 10.w,),
              Expanded(child: _InfoCard(title: 'Balance', amount: balanceAmount)),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String amount;

  const _InfoCard({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [Color(0xFF8685CF), Color(0xFF6962BB)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Text(
            'Rs ${amount}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
