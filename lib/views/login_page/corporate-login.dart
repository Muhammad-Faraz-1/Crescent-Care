// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompanyCodeInput extends StatefulWidget {
  @override
  State<CompanyCodeInput> createState() => _CompanyCodeInputState();
}

class _CompanyCodeInputState extends State<CompanyCodeInput> {
  final int length = 7;
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(length, (_) => FocusNode());
    _controllers = List.generate(length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    _focusNodes.forEach((f) => f.dispose());
    _controllers.forEach((c) => c.dispose());
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (value.length > 1) {
        for (int i = 0; i < value.length && (index + i) < length; i++) {
          _controllers[index + i].text = value[i];
        }
        int next =
            (index + value.length < length) ? index + value.length : length - 1;
        _focusNodes[next].requestFocus();
      } else {
        if (index + 1 < length) {
          _focusNodes[index + 1].requestFocus();
        }
      }
    }
  }

  void _onKey(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent && event.logicalKey.keyLabel == 'Backspace') {
      if (_controllers[index].text.isEmpty && index > 0) {
        _focusNodes[index - 1].requestFocus();
        _controllers[index - 1].text = '';
      }
    }
  }

  Widget _buildCodeBox(int index) {
    return Container(
      width: 30,
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border.all(color: Color(0xFFF0F0F0)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) => _onKey(event, index),
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          onChanged: (value) => _onChanged(value, index),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6962BB),
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
        ),
      ),
    );
  }

  Widget _buildDashBox() {
    return Container(
      width: 20,
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0, 1),
            blurRadius: 7,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        '-',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6962BB),
        ),
      ),
    );
  }

  List<Widget> _buildBoxesWithDash() {
    List<Widget> items = [];
    for (int i = 0; i < length; i++) {
      items.add(_buildCodeBox(i));
      if (i == 3) {
        items.add(_buildDashBox()); // insert dash after 4th box
      }
    }
    return items;
  }

  String get fullCode {
    final parts = _controllers.map((c) => c.text).toList();
    return parts.sublist(0, 4).join() + '-' + parts.sublist(4).join();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "Company Code",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF535353),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _buildBoxesWithDash(),
              ),
            ),
            SizedBox(height: 20),
            Text("Full Code: $fullCode", style: TextStyle(fontSize: 16)),
          ],
        ),
      );
  }
}
