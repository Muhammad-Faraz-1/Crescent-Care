import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: theme.tertiaryContainer,
        border: Border(bottom: BorderSide(color: theme.tertiary, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
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
              SizedBox(width: 10),
              TextWidget(
                size: medium,
                fontWeight: mediumWeight,
                lineheight: lineMedium,
                color: theme.secondary,
                val: 'Activities',
              ),
            ],
          ),
          Row(
            children: [
              // SvgPicture.asset('assets/img/search.svg'),
              // SizedBox(width: 10),
              SvgPicture.asset('assets/img/bell.svg'),
            ],
          ),
        ],
      ),
    );
  }
}
