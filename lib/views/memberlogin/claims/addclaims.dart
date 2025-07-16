import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/views/memberlogin/claims/claimspage.dart';
import 'package:crescent_care/views/memberlogin/claims/uploadedfiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Addclaims extends StatelessWidget {
  const Addclaims({super.key});

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
              if (provider.addingfile)
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    InvoiceUploadDynamic(),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          provider.addFile();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.secondaryContainer,
                          ),
                          child: SvgPicture.asset('assets/img/plus.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20.h),
              InputInfo(label: 'Name'),
              SizedBox(height: 10.h),
              InputInfo(label: 'Amount'),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  provider.adding(true);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: theme.secondaryContainer,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: theme.tertiaryContainer,
                    fontSize: 15.sp,
                    height: 1.2,
                  ),
                ),
              ),
              SizedBox(height: 70.h),
            ],
          ),
        ),
      ),
    );
  }
}
