import 'package:flutter/material.dart';
import 'package:islamic/core/theme/aap_colors.dart';

import '../../../../core/constants/app_assets.dart';
import '../widgets/azkar_card.dart';
import '../widgets/prayer_time_card.dart';

class TimesTab extends StatelessWidget {
  const TimesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.azkarBackground),
              fit: BoxFit.cover,
            ),
          ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppAssets.quranLogo,
              height: 100,
            ),
            PrayerTimeCard(),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Azkar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AzkarCard(
                  title: 'Evening Azkar',
                  image: AppAssets.azkarEveningIcon,
                ),
                AzkarCard(
                  title: 'Morning Azkar',
                  image: AppAssets.azkarMoarningIcon,
                ),
              ],
            )
        
          ],
        ),
      ),
    );
  }
}
