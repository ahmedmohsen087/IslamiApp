import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/services /local_storge_keys.dart';
import '../../../core/services /local_storge_services.dart';
import '../../layout/layout_page.dart';
import '../../on_boarding_page/pages/on_boarding_pages.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'splash';
  static const Duration duration = Duration(seconds: 2);

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      final bool isFirst =
          LocalStorageService.getBool(
            LocalStorageKeys.isFirstTimeOpen,
          ) ??
              true;

      Navigator.pushReplacementNamed(
        context,
        isFirst
            ? OnBoardingScreen.routeName
            : LayoutPage.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.splashBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FadeInDown(
                duration: SplashPage.duration,
                child: Image(
                  image: AssetImage(AppAssets.splashGlow),
                  height: size.height * .30,
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: SplashPage.duration,
                child: Image(
                  image: AssetImage(AppAssets.splashLOGO),
                  height: size.height * .30,
                ),
              ),
            ),

            Positioned(
              bottom: size.height * .25,
              left: 0,
              right: 0,
              child: Center(
                child: ZoomIn(
                  duration: SplashPage.duration,
                  child: Image(
                    image: AssetImage(AppAssets.logoBG),
                    height: size.width * .20,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: size.height * .25,
              right: 0,
              child: FadeInRight(
                duration: SplashPage.duration,
                child: Image(
                  image: AssetImage(AppAssets.splashLeftLOGO),
                  width: size.width * .20,
                ),
              ),
            ),

            Positioned(
              top: size.height * .25,
              left: 0,
              child: FadeInLeft(
                duration: SplashPage.duration,
                child: Image(
                  image: AssetImage(AppAssets.splashRightLOGO),
                  width: size.width * .20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
