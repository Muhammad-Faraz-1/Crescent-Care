import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Membercards extends StatelessWidget {
  const Membercards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 340.w,
      child: Stack(
        children: [
          Positioned(top: 0, left: 0, child: PolicyCard()),
          Positioned(top: 20, left: 10, child: PolicyCard()),
          Positioned(top: 40, left: 20, child: PolicyCard()),
        ],
      ),
    );
  }
}



class PolicyCard extends StatelessWidget {
  const PolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: SizedBox(
        height: 240.h,
        width: 310.w,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(child: Container(color: Color(0xffD63327))),
                  Expanded(child: Container(color: Color(0xff32A848))),
                  Expanded(child: Container(color: Color(0xff263D93))),
                ],
              ),
            ),

            // Main content
            Expanded(
              flex: 18,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Policy No and Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Policy No    2025/04/T106HHHTDP00099',
                          style: TextStyle(fontSize: small),
                        ),
                        SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: Image.asset(
                            'assets/img/cc.png', // Replace with your actual path
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Name and company
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Muhammad Zuhair Haider',
                              style: TextStyle(
                                fontWeight: semiBold,
                                fontSize: body.sp,
                              ),
                            ),
                            Text(
                              'Sibisoft Private Limited',
                              style: TextStyle(fontSize: body.sp),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Effective Date',
                                  style: TextStyle(fontSize: small),
                                ),
                                Text(
                                  '10/05/2025',
                                  style: TextStyle(
                                    fontWeight: semiBold,
                                    fontSize: small.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              children: [
                                Text(
                                  'Expiry Date',
                                  style: TextStyle(fontSize: small.sp),
                                ),
                                Text(
                                  '10/05/2030',
                                  style: TextStyle(
                                    fontWeight: semiBold,
                                    fontSize: small.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    // Card details
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Card No',
                            style: TextStyle(fontSize: small.sp),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            'SM1236favsvd621321612',
                            style: TextStyle(
                              fontSize: small.sp,
                              fontWeight: mediumWeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Policy Type',
                            style: TextStyle(fontSize: small.sp),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            'Takaful',
                            style: TextStyle(
                              fontSize: small.sp,
                              fontWeight: mediumWeight,
                            ),
                          ),
                        ),
                      ],
                    ),

                     Divider(height: 10.h),

                     Text(
                      'BENEFITS COVERED',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: body.sp,
                      ),
                    ),
                     SizedBox(height: 5.h),

                    // Benefits Grid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hospital Limit',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: regular,
                                ),
                              ),
                              Text(
                                '15,000',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: mediumWeight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20.w),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Maternity',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: regular,
                                ),
                              ),
                              Text(
                                'YES',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: mediumWeight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Room Entitlement',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: regular,
                                ),
                              ),
                              Text(
                                'YES',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: mediumWeight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20.w),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Emergency',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: regular,
                                ),
                              ),
                              Text(
                                'YES',
                                style: TextStyle(
                                  fontSize: small.sp,
                                  fontWeight: mediumWeight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
