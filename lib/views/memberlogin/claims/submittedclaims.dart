import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Submittedclaims extends StatelessWidget {
  const Submittedclaims({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    provider.submittedpopupshow(true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: theme.secondaryContainer),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextWidget(
                      size: body,
                      fontWeight: mediumWeight,
                      lineheight: lineMedium,
                      color: theme.secondaryContainer,
                      val: 'Filters',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Submittedbox(),
              SizedBox(height: 10),
              Submittedbox(),
              SizedBox(height: 10),
              Submittedbox(),
            ],
          ),
        ),
      ),
    );
  }
}

class Submittedbox extends StatelessWidget {
  const Submittedbox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      width: 320.w,
      // height: 83,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primaryContainer,
        border: Border.all(color: theme.tertiary),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Claim ID and Self Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Claim ID
              Text(
                '00001277920',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: theme.secondary,
                ),
              ),
              // Self Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(105, 98, 187, 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Self',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          // Claim Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Name and Docs Count
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Muhammad Zuhair Haider',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.secondary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 25.w,
                        child: Text(
                          'no of docs',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: theme.secondary,
                            height: 1.1
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '3',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: theme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Date Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.onSecondary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '12 Jan 2025',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.secondary,
                    ),
                  ),
                ],
              ),

              // Claim Amount Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Claim Amount',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.onSecondary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Rs 2,000',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.secondary,
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
