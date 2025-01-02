import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/core/theme/aap_colors.dart';
import 'package:islamic/models/recent_data.dart';

class QuranMostRecently extends StatelessWidget {
  final RecentData recentData;

  const QuranMostRecently({super.key, required this.recentData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  recentData.suraNameEn,
                  style: GoogleFonts.badScript(
                      fontSize: 24,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recentData.suraNameAR,
                  style: GoogleFonts.badScript(
                      fontSize: 24,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recentData.suraVerses,
                  style: GoogleFonts.badScript(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Image(image: AssetImage(AppAssets.quranRecentlyImage))
        ],
      ),
    );
  }
}
