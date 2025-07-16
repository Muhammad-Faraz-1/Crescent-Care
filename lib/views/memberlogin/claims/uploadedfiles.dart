import 'package:crescent_care/controllers/statemanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class InvoiceUploadDynamic extends StatelessWidget {
  const InvoiceUploadDynamic({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    double fileHeight = 36; // height for each file + spacing
    double lineHeight = provider.uploadedFiles.length * fileHeight;

    return Stack(
      children: [
        // Container box
        Container(
          width: 320.w,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            border: Border.all(color: Color(0xFFF0F0F0)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Invoice',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 1.25,
                  color: Color(0xFF757575),
                ),
              ),
              SizedBox(height: 10.h),

              // File list
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children:
                      provider.uploadedFiles.asMap().entries.map((entry) {
                        int index = entry.key;
                        String file = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: InvoiceItem(
                            filename: file,
                            onRemove: () => provider.removeFile(index),
                          ),
                        );
                      }).toList(),
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),

        // Vertical dynamic line on left
        Positioned(
          left: 10,
          top: 25,
          child: Container(
            width: 1,
            height: lineHeight - 15,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Color(0xFF757575), width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InvoiceItem extends StatelessWidget {
  final String filename;
  final VoidCallback onRemove;

  const InvoiceItem({
    super.key,
    required this.filename,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w, child: Divider(thickness: 1, color: Colors.black)),
        SizedBox(width: 5.w),
        Expanded(
          child: Container(
            // width: 280,
            height: 31,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFF0F0F0)),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    filename,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      height: 1.5,
                      color: Color(0xFF6962BB),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onRemove,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset('assets/img/cancel.svg'),
                  )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
