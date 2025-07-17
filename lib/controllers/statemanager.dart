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

  // -------------------- Navbar --------------------

  int navbtn = 1;
  setnavbtn(int id) {
    navbtn = id;
    notifyListeners();
  }

  // -------------------- BMI PAGES --------------------

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

  // -------------------- AGE SELECTOR --------------------

  final List<String> ageList = List.generate(
    83,
    (index) => (index + 18).toString(),
  );
  int selectedAgeIndex = 0;
  String? selectedAgeValue;
  final PageController agePageController = PageController(
    viewportFraction: 0.25,
  );

  void setSelectedAgeIndex(int index) {
    selectedAgeIndex = index;
    notifyListeners();
  }

  void saveSelectedAgeValue() {
    selectedAgeValue = ageList[selectedAgeIndex];
    print('Selected Age: $selectedAgeValue');
    notifyListeners();
  }

  void restoreAgeSelection() {
    agePageController.jumpToPage(selectedAgeIndex);
  }

  // -------------------- HEIGHT SELECTOR --------------------

  final FixedExtentScrollController heightScrollController =
      FixedExtentScrollController(initialItem: 5);

  int selectedHeightIndex = 5;
  String? selectedHeightValue;

  final List<String> heightList = List.generate(61, (i) => '${140 + i} cm');

  void setSelectedHeightIndex(int index) {
    selectedHeightIndex = index;
    notifyListeners();
  }

  void saveSelectedHeightValue() {
    selectedHeightValue = heightList[selectedHeightIndex];
    print('Selected Height: $selectedHeightValue');
    notifyListeners();
  }

  void restoreHeightSelection() {
    heightScrollController.jumpToItem(selectedHeightIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  // -------------------- WEIGHT SELECTOR --------------------
  final List<String> weightList = List.generate(
    100,
    (index) => '${30 + index} Kg',
  );
  final PageController weightPageController = PageController(
    viewportFraction: 0.35,
  );

  int selectedWeightIndex = 0;
  String? selectedWeightValue;

  void setSelectedWeightIndex(int index) {
    selectedWeightIndex = index;
    notifyListeners();
  }

  void saveSelectedWeightValue() {
    selectedWeightValue = weightList[selectedWeightIndex];
    print('Selected Weight: $selectedWeightValue');
    notifyListeners();
  }

  void restoreWeightSelection() {
    weightPageController.jumpToPage(selectedWeightIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void disposeControllers() {
    agePageController.dispose();
    heightScrollController.dispose();
    weightPageController.dispose();
  }

  // -------------------- login popup animate --------------------
  bool showlogin = false;
  double bottompos = 400;
  showloginpopup(bool val) {
    showlogin == val;
    notifyListeners();
    loginposition();
  }

  loginposition() {
    if (showlogin) {
      bottompos = 0;
    } else {
      bottompos = 400;
    }
    notifyListeners();
  }

  // -------------------- Member's login tab bar --------------------
  int selected = 1;
  selectedtab(int val) {
    selected = val;
    notifyListeners();
  }

  // -------------------- policy popup --------------------
  int currentpolicy = 1;
  selectedpolicy(int val) {
    currentpolicy = val;
    notifyListeners();
  }

  // -------------------- claims tabs --------------------
  int selectedclaimtab = 1;
  claimtab(int val) {
    selectedclaimtab = val;
    notifyListeners();
  }

  // -------------------- Claims files --------------------
  bool addingfile = false;
  adding(bool val) {
    addingfile = val;
    notifyListeners();
  }

  List<String> uploadedFiles = [
    'invoice-darulsehat.pdf',
    'invoice-essalabs.pdf',
  ];

  addFile() {
    uploadedFiles.add('invoice-${uploadedFiles.length + 1}.pdf');
    notifyListeners();
  }

  removeFile(int index) {
    uploadedFiles.removeAt(index);
    notifyListeners();
  }

  // -------------------- Claims popups --------------------
  bool submitpopup = false;
  double submitbottom = -500;
  submittedpopupshow(bool val) {
    submitpopup = val;
    notifyListeners();
    submitpostion();
  }

  submitpostion() {
    if (submitpopup) {
      submitbottom = 0;
    } else {
      submitbottom = -500;
    }
    notifyListeners();
  }

  bool processpopup = false;
  double processbottom = -500;

  showprocessfilters(bool val) {
    processpopup = val;
    notifyListeners();
    processposition();
  }

  processposition() {
    if (processpopup) {
      processbottom = 0;
    } else {
      processbottom = -500;
    }
    notifyListeners();
  }
}
