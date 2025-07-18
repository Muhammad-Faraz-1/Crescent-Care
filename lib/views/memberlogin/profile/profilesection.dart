import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      // height: 395,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        border: Border.all(color: Color(0xFFF0F0F0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Background Image Rectangle
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 300,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/img/company.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Color(0xFFF0F0F0)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Profile Picture
              Positioned(
                bottom: -35,
                right: 35,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/profile.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF535353)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          // Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Muhammad Zuhair Haider',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color(0xFF6962BB),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // CNIC
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'CNIC',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '42201-8914646-1',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color(0xFF6962BB),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'zuhair.haider@globalnorthstar.com',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color(0xFF6962BB),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Contact & Gender
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  // width: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xFF757575),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '0334-3056685',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xFF6962BB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  // width: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xFF757575),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xFF6962BB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // DOB & Age
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  // width: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Date Of Birth',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF757575),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF6962BB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  // width: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF757575),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '35',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF6962BB),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
