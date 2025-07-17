import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/main.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: theme.primaryContainer,
        border: Border(top: BorderSide(color: theme.tertiary, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: navbutton(id: 1, title: 'Home', icon: 'home'),
          ),
          Expanded(
            flex: 1,
            child: navbutton(
              id: 2,
              title: 'Consultation',
              icon: 'consultation',
            ),
          ),
          Expanded(
            flex: 1,
            child: navbutton(id: 3, title: 'Chat', icon: 'chats'),
          ),
          Expanded(
            flex: 1,
            child: navbutton(id: 4, title: 'More', icon: 'more'),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class navbutton extends StatelessWidget {
  int? id;
  String? title;
  String? icon;
  navbutton({
    super.key,
    required this.id,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        provider.setnavbtn(id!);
        provider.navbtn == 1
            ? Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => bodyapp(),
              ),
            )
            : null;
      },
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 28.h,
            child: Center(
              child: SvgPicture.asset(
                'assets/img/${icon}.svg',
                height: 20.h,
                width: 20.w,
                color:
                    provider.navbtn == id
                        ? theme.secondaryContainer
                        : theme.onSecondary,
              ),
            ),
          ),
          TextWidget(
            size: small,
            fontWeight: semiBold,
            lineheight: lineMedium,
            color:
                provider.navbtn == id
                    ? theme.secondaryContainer
                    : theme.onSecondary,
            val: title,
          ),
        ],
      ),
    );
  }
}
