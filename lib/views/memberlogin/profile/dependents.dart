import 'package:crescent_care/controllers/statemanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Dependents extends StatelessWidget {
  final Duration duration;
  final int id;

  const Dependents({
    super.key,
    this.duration = const Duration(milliseconds: 300),
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return GestureDetector(
      onTap: () {
        provider.showdependentdetails(id);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 320.w,
        height: provider.defaultdependent == id ? 335 : 42,
        // margin: const EdgeInsets.only(top: 20, left: 20),
        // clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          border: Border.all(color: const Color(0xFFF0F0F0)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header (Name row)
            Container(
              width: 320,
              height: 40,
              padding:  EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Color.fromARGB(38, 0, 0, 0), blurRadius: 6),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Syed Rabab Raza',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6962BB),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '-',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6962BB),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Spouse',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6962BB),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.expand_more,
                    color: Color(0xFF535353),
                    size: 20,
                  ),
                ],
              ),
            ),
      
            // Details (Animated)
            if (provider.defaultdependent==id)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const [
                    InfoRow(label: 'Name', value: 'Syed Rabab Raza'),SizedBox(height: 10,),
                    InfoRow(label: 'Document No', value: '123g12g312y8712'),SizedBox(height: 10,),
                    InfoRow(
                      label: 'Email',
                      value: 'rabab.raza221.crescentcareapp@gmail.com',
                    ),SizedBox(height: 10,),
                    InfoRow(label: 'Date Of Birth', value: '12 January 1989'),SizedBox(height: 10,),
                    InfoRow(label: 'Plan Code', value: 'Plan A'),SizedBox(height: 10,),
                    InfoRow(label: 'Gender', value: 'Male'),SizedBox(height: 10,),
                    InfoRow(label: 'Age', value: '36'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xFF757575),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6962BB),
            ),
          ),
        ],
      ),
    );
  }
}
