import 'package:flutter/material.dart';

import '../../../core/theme/aap_colors.dart';

class BoardingModel extends StatelessWidget {
  final String logo;

  final String image;

  final String title;

  final String body;

  static const routeName = 'test';

  const BoardingModel(
      {super.key,
      required this.logo,
      required this.image,
      required this.title,
      required this.body});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(logo),
              width: size.width * .50,
            ),
            Image(
              image: AssetImage(image),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
