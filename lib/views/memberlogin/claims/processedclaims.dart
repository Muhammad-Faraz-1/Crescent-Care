import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Processedclaims extends StatelessWidget {
  const Processedclaims({super.key});

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
                    provider.showprocessfilters(true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: theme.secondaryContainer,
                      ),
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
              Processedbox(),
              SizedBox(height: 10),
              Processedbox(),
              SizedBox(height: 10),
              Processedbox(),
            ],
          ),
        ),
      ),
    );
  }
}

class Processedbox extends StatelessWidget {
  const Processedbox({super.key});

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
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(width: 5.w),
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
              SizedBox(height: 20, child: Image.asset('assets/img/eye.png')),

              // child: SvgPicture.asset('assets/img/eye.svg'),)
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
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'SMCHSM100041/02',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.secondary,
                      height: 1.2,
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
                      height: 1.2,
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
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              Container(
                width: 80.w,
                // height: 20,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xff32A848).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    'Approved',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff32A848),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
