// import 'package:crescent_care/utils/theme.dart';
import 'package:flutter/material.dart';

class Statemaneger extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setLightTheme() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDarkTheme() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setCustomTheme() {
    // you can create a custom enum if needed or manage externally
    _themeMode = ThemeMode.system; // or use custom logic
    notifyListeners();
  }

  // /////////////////
  // navbar
  // /////////////////
  int navbtn = 1;
  setnavbtn(int id) {
    navbtn = id;
    notifyListeners();
  }

  // /////////////////
  // age selector
  // /////////////////
  final List<String> ageList = [
    '29 yrs',
    '30 yrs',
    '31 yrs',
    '32 yrs',
    '33 yrs',
    '34 yrs',
    '35 yrs',
    '36 yrs',
    '37 yrs',
    '38 yrs',
  ];

  int selectedAgeIndex = 0;
  PageController? agePageController;

  void initAgeSelector() {
    selectedAgeIndex = (ageList.length / 2).floor();
    agePageController = PageController(
      initialPage: selectedAgeIndex,
      viewportFraction: 0.22,
    );

    // Listen to page changes
    agePageController!.addListener(() {
      final newIndex = agePageController!.page!.round();
      if (newIndex != selectedAgeIndex) {
        selectedAgeIndex = newIndex;
        notifyListeners();
      }
    });
  }

  // // /////////////////
  // // bmi calculator
  // // /////////////////
  bool bmiCalculator = false;
  int bmistep = 0;
  bmistepsforward(int step) {
    bmistep = step;
    notifyListeners();
  }
  bmistepsack() {
    bmistep = bmistep - 1;
    notifyListeners();
  }

  void toggleBmiCalculator(bool value) {
    bmiCalculator = value;
    notifyListeners();
  }

  // // /////////////////
  // // height selector
  // /////////////////
   final FixedExtentScrollController heightScrollController =
      FixedExtentScrollController(initialItem: 5);

  int selectedHeightIndex = 5;

  final List<String> heightList = List.generate(61, (i) => '${140 + i} cm');

  void setSelectedHeightIndex(int index) {
    selectedHeightIndex = index;
    notifyListeners();
  }
}
