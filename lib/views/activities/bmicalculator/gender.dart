import 'package:crescent_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  PageController _pageController = PageController(viewportFraction: 0.7);
  int _selectedGenderIndex = 0;

  List<String> genderImages = ['assets/img/boy.png', 'assets/img/girl.png'];

  void _onGenderTap(int index) {
    setState(() {
      _selectedGenderIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: genderImages.length,
            onPageChanged: (index) {
              setState(() => _selectedGenderIndex = index);
            },
            itemBuilder: (context, index) {
              final isSelected = index == _selectedGenderIndex;
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: isSelected == true ? 200.h : 150.h,
                width: isSelected == true ? 200.h : 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                  border: Border.all(
                    color: isSelected ? theme.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(genderImages[index], fit: BoxFit.contain),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          height: 45.h,
          width: 220.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade200,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _onGenderTap(0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          _selectedGenderIndex == 0
                              ? theme.primary
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: TextWidget(
                      size: medium,
                      fontWeight: semiBold,
                      lineheight: lineMedium,
                      color:
                          _selectedGenderIndex == 0
                              ? theme.tertiaryContainer
                              : theme.primary,
                      val: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => _onGenderTap(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          _selectedGenderIndex == 1
                              ? theme.primary
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: TextWidget(
                      size: medium,
                      fontWeight: semiBold,
                      lineheight: lineMedium,
                      color:
                          _selectedGenderIndex == 1
                              ? theme.tertiaryContainer
                              : theme.primary,
                      val: 'Female',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
