import 'package:crescent_care/controllers/statemanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PolicyPopupWidget extends StatelessWidget {
  const PolicyPopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    final theme = Theme.of(context).colorScheme;
    // final provider = Provider.of<Statemaneger>(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(0),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Policy',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: theme.secondary,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 15.h),
            _PolicyCard(
              title: 'Parents Hospitalization',
              subtitle: 'w9789d7d82e782',
              id: 1,
            ),
            _PolicyCard(
              title: 'Family Hospitalization',
              subtitle: 'diuyqwieyuqwyeu',
              id: 2,
            ),
            _PolicyCard(
              title: 'Out-Patient',
              subtitle: '27827ye782ys2312',
              id: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class _PolicyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int id;
  // final bool isChecked;

  const _PolicyCard({
    required this.title,
    required this.subtitle,
    required this.id,
    // this.isChecked = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    return GestureDetector(
      onTap: () {
        provider.selectedpolicy(id);
      },
      child: Container(
        width: double.infinity,
        height: 60.h,
        margin:  EdgeInsets.only(bottom: 10.h),
        padding:  EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:
              provider.currentpolicy == id
                  ? Colors.white
                  : const Color(0xFFFAFAFA),
          border: Border.all(
            color:
                provider.currentpolicy == id
                    ? const Color(0xFF6962BB)
                    : const Color(0xFFF0F0F0),
          ),
          borderRadius: BorderRadius.circular(4),
          boxShadow:
              provider.currentpolicy == id
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ]
                  : [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: Color(0xFF757575),
                    ),
                  ),
                  
                  Align(
                    alignment: provider.currentpolicy==id? Alignment.centerLeft:Alignment.centerRight,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Color(0xFF757575),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (provider.currentpolicy == id)
              Center(child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset('assets/img/check.svg'))),
          ],
        ),
      ),
    );
  }
}
