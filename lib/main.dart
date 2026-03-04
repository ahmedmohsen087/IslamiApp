import 'package:flutter/material.dart';
import 'package:islamic/core/services%20/local_storge_services.dart';
import 'package:islamic/features/splash/pages/splash_page.dart';
import 'package:islamic/provider/radio_manger_provider.dart';
import 'package:provider/provider.dart';

import 'features/layout/layout_page.dart';
import 'features/layout/quran/pages/quran_details_view.dart';
import 'features/on_boarding_page/pages/on_boarding_pages.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  runApp(ChangeNotifierProvider(create: (context) => RadioMangerProvider(),
  child: MyApp()));
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
        QuranDetailsView.routeName: (context) => QuranDetailsView(),
      },
    );
  }
}
