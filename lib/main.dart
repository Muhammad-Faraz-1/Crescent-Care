import 'package:crescent_care/controllers/apidata.dart';
import 'package:crescent_care/controllers/statemanager.dart';
import 'package:crescent_care/utils/navbar.dart';
import 'package:crescent_care/utils/theme.dart';
import 'package:crescent_care/views/dashboard/dashboardpage.dart';
import 'package:crescent_care/views/memberlogin/memberspage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Statemaneger(),
        ),
        ChangeNotifierProvider(create: (context) => apihandler()),
      ],
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
          // home: const body(),
          home: Memberspage(),
          // home: SplashScreen(),
        );
      },
    );
  }
}

class bodyapp extends StatelessWidget {
  const bodyapp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Dashboard(),
            // Activities(),
            Positioned(bottom: 0, left: 0, right: 0, child: Navbar()),
          ],
        ),
      ),
    );
  }
}
