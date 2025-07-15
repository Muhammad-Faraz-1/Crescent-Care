// ignore_for_file: must_be_immutable

import 'package:crescent_care/controllers/statemanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HorizontalTabBar extends StatelessWidget {
  const HorizontalTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      // height: 38.h,
      
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              TabItem(label: 'Overview', isSelected: true, id: 1),
              TabItem(label: 'Profile', id: 2),
              TabItem(label: 'Utilization', id: 3),
              TabItem(label: 'Claims', id: 4),
              TabItem(label: 'Approvals', id: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  int? id;

  TabItem({
    super.key,
    required this.label,
    this.isSelected = false,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return GestureDetector(
      onTap: () {
        provider.selectedtab(id!);
      },
      child: Container(
        width: 80.w,
        // height: 38.h,
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0), // optional spacing
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          border:
              provider.selected == id
                  ? Border(
                    bottom: BorderSide(
                      color: theme.secondaryContainer, // primary color
                      width: 1,
                    ),
                  )
                  : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 12,
              height: 1.5, // line-height 18px on 12px font
              color: provider.selected == id ? theme.secondaryContainer : theme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
