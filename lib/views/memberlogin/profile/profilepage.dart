import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:crescent_care/views/memberlogin/profile/dependents.dart';
import 'package:crescent_care/views/memberlogin/profile/profilesection.dart';
import 'package:crescent_care/views/memberlogin/utilization/policypopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileCard(),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const PolicyPopupWidget(),
                  );
                },
                child: Row(
                  children: [
                    TextWidget(
                      size: body,
                      fontWeight: semiBold,
                      lineheight: linesmall,
                      color: theme.primary,
                      val: 'Policy:',
                    ),
                    SizedBox(width: 10.w),
                    TextWidget(
                      size: medium,
                      fontWeight: mediumWeight,
                      lineheight: linesmall,
                      color: Color(0xff757575),
                      val:
                          provider.currentpolicy == 1
                              ? 'Parents  Hospitalization'
                              : provider.currentpolicy == 2
                              ? 'Family Hospitalization '
                              : 'Out-Patient',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  size: medium,
                  fontWeight: mediumWeight,
                  lineheight: linesmall,
                  color: Color(0xff757575),
                  val: 'Dependents',
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 70, width: 70,child: Image.asset('assets/img/avatar.png'),),
                      SizedBox(height: 5),
                      TextWidget(
                        size: small,
                        fontWeight: mediumWeight,
                        lineheight: linesmall,
                        color: theme.onSecondary,
                        val: 'Syeda Rabab Raza',
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      SizedBox(height: 70, width: 70,child: Image.asset('assets/img/avatar.png'),),
                      SizedBox(height: 5),
                      TextWidget(
                        size: small,
                        fontWeight: mediumWeight,
                        lineheight: linesmall,
                        color: theme.onSecondary,
                        val: 'Maryam Haider',
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      SizedBox(height: 70, width: 70,child: Image.asset('assets/img/avatar.png'),),
                      SizedBox(height: 5),
                      TextWidget(
                        size: small,
                        fontWeight: mediumWeight,
                        lineheight: linesmall,
                        color: theme.onSecondary,
                        val: 'Zoha Haider',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Dependents(id: 1),
              SizedBox(height: 10),
              Dependents(id: 2),
              SizedBox(height: 10),
              Dependents(id: 3),
            ],
          ),
        ),
      ),
    );
  }
}
