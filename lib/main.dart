import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/theme.dart';
import 'package:crescent_care/views/dashboard/dashboardpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Statemaneger(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 928),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Crescent Care',
          theme: ThemeDataStyle.light,
          home: const Dashboard(),
        );
      },
    );
  }
}
