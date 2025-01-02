import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../layout/layout_page.dart';
import '../../on_boarding_page/pages/on_boarding_pages.dart';
import '../../on_boarding_page/widgets/boarding_item.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'splash';
  static final Duration _duration = const Duration(seconds: 2);

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      //Navigator.pushReplacementNamed(context, BoardingModel.routeName);
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.splashBG,
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FadeInDown(
                duration: SplashPage._duration,
                child: Image(
                  image: AssetImage(AppAssets.splashGlow),
                  height: size.height * .30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                delay: Duration(seconds: 3),
                duration: SplashPage._duration,
                child: Image(
                  image: AssetImage(AppAssets.splashLOGO),
                  height: size.height * .30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * .25),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ZoomIn(
                  delay: Duration(seconds: 3),
                  duration: SplashPage._duration,
                  child: Image(
                    image: AssetImage(AppAssets.logoBG),
                    height: size.width * .20,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * .25),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: FadeInRight(
                    duration: SplashPage._duration,
                    child: Image(
                      image: AssetImage(AppAssets.splashLeftLOGO),
                      width: size.width * .20,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * .25),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: FadeInLeft(
                    duration: SplashPage._duration,
                    child: Image(
                      image: AssetImage(AppAssets.splashRightLOGO),
                      width: size.width * .20,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
