import 'package:flutter/material.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/features/on_boarding_page/widgets/boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/theme/aap_colors.dart';
import '../../layout/layout_page.dart';

class OnBoardingScreenWidget extends StatefulWidget {
  @override
  State<OnBoardingScreenWidget> createState() => _OnBoardingScreenWidgetState();
}

class _OnBoardingScreenWidgetState extends State<OnBoardingScreenWidget> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        logo: AppAssets.onBoardingLogo,
        image: AppAssets.onBoardingBackGround1,
        title: 'Welcome To Islam App',
        body: ''),
    BoardingModel(
        logo: AppAssets.onBoardingLogo,
        image: AppAssets.onBoardingBackGround2,
        title: 'Welcome To Islam App',
        body: 'We Are Very Excited To Have You In Our Community'),
    BoardingModel(
        logo: AppAssets.onBoardingLogo,
        image: AppAssets.onBoardingBackGround3,
        title: 'Welcome To Islam App',
        body: 'Read, and your Lord is the Most Generous'),
    BoardingModel(
        logo: AppAssets.onBoardingLogo,
        image: AppAssets.onBoardingBackGround4,
        title: 'Welcome To Islam App',
        body: 'Praise the name of your Lord, the Most High'),
    BoardingModel(
        logo: AppAssets.onBoardingLogo,
        image: AppAssets.onBoardingBackGround5,
        title: 'Welcome To Islam App',
        body:
            'You can listen to the Holy Quran Radio through the application for free and easily'),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
              itemBuilder: (context, index) => (boarding[index]),
              itemCount: boarding.length,
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          Container(
            color: AppColors.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (isLast) {
                        boardController.previousPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.bounceOut);
                      } else {
                        boardController.previousPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primaryColor),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.gray,
                      activeDotColor: AppColors.primaryColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (isLast) {
                        Navigator.pushReplacementNamed(
                            context, LayoutPage.routeName);
                      } else {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
