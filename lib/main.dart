import 'package:flutter/material.dart';
import 'package:islamic/features/splash/pages/splash_page.dart';

import 'features/layout/pages/layout_page.dart';
import 'features/on_boarding_page/pages/on_boarding_pages.dart';
import 'features/on_boarding_page/widgets/boarding_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        LayoutPage.routeName: (context) => const LayoutPage(),
        //BoardingModel.routeName: (context) => const BoardingModel(),
      },
    );
  }
}
