import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UploadPopup extends StatelessWidget {
  const UploadPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<Statemaneger>(context);
    return Stack(
      children: [
        // Background tap to dismiss
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              provider.showfileupload(false);
            },
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
        ),

        // Slide-in Panel
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 340,
            // height: 224,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    TextWidget(
                      size: large,
                      fontWeight: mediumWeight,
                      lineheight: linesmall,
                      color: theme.secondary,
                      val: 'Add Claims',
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        provider.showfileupload(false);
                      },
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/img/cancel.svg',
                          colorFilter: ColorFilter.mode(
                            theme.secondary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DocumentTypeDropdown(),
                SizedBox(height: 10),
                // Upload area
                Container(
                  width: 300,
                  height: 146,
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFF0F0F0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/upload.png', // replace with actual asset
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Click to upload',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF535353),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Acceptable file type: pdf, docx (max 50MB)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    provider.adding(true);
                    provider.addFile();
                    provider.showfileupload(false);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: theme.secondaryContainer,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Attach Files",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: theme.tertiaryContainer,
                      fontSize: 15..sp,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DocumentTypeDropdown extends StatefulWidget {
  final String? initialValue;

  const DocumentTypeDropdown({super.key, this.initialValue});

  @override
  State<DocumentTypeDropdown> createState() => _DocumentTypeDropdownState();
}

class _DocumentTypeDropdownState extends State<DocumentTypeDropdown> {
  final List<String> _types = [
    'Invoice',
    'Medical Reports',
    'Lab Reports',
    'Prescription',
  ];

  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      hint: const Text('Select Document Type'),
      items:
          _types.map((type) {
            return DropdownMenuItem(value: type, child: Text(type));
          }).toList(),
      onChanged: (value) {
        provider.filetypetext(value!);
        setState(() => _selectedValue = value);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xfff0f0f0)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xfff0f0f0)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      ),
    );
  }
}
