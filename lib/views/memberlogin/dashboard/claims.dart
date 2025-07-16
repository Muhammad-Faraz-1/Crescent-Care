import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClaimDetailsCard extends StatelessWidget {
  const ClaimDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 320.w,
      // height: 230.h,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        border: Border.all(color: const Color(0xFFF0F0F0)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Claims',
                style: TextStyle(
                  color: theme.secondary,
                  fontFamily: 'Poppins',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '19',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: theme.secondary,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // Main Claims Grid
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ClaimBox(
                    title: 'Approved Claims',
                    count: '10',
                    worth: 'worth Rs 242,000',
                  ),
                  _ClaimBox(
                    title: 'Rejected Claims',
                    count: '5',
                    worth: 'worth Rs 22,000',
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              _SubmittedClaimBox(
                title: 'Submitted Claims',
                count: '4',
                worth: 'worth Rs 17,000',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Approved & Rejected Box
class _ClaimBox extends StatelessWidget {
  final String title;
  final String count;
  final String worth;

  const _ClaimBox({
    required this.title,
    required this.count,
    required this.worth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 144.w,
      // height: 92,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF8685CF), Color(0xFF6962BB)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme.tertiaryContainer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    count,
                    style: TextStyle(
                      fontSize: 25.sp,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: theme.tertiaryContainer,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    worth,
                    style: TextStyle(
                      fontSize: 8.sp,
                      height: 1.25,
                      fontWeight: FontWeight.w500,
                      color: theme.tertiaryContainer,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Submitted Claims (wider box)
class _SubmittedClaimBox extends StatelessWidget {
  final String title;
  final String count;
  final String worth;

  const _SubmittedClaimBox({
    required this.title,
    required this.count,
    required this.worth,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: 300.w,
      // height: 58.h,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8685CF), Color(0xFF6962BB)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: theme.tertiaryContainer,
              fontFamily: 'Poppins',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                count,
                style: TextStyle(
                  fontSize: 25.sp,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: theme.tertiaryContainer,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                worth,
                style: TextStyle(
                  fontSize: 8.sp,
                  height: 1.25,
                  fontWeight: FontWeight.w500,
                  color: theme.tertiaryContainer,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
