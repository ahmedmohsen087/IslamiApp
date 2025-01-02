import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/theme/aap_colors.dart';

import '../../../../../core/constants/app_assets.dart';

class QuranSearchBar extends StatelessWidget {
  const QuranSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.badScript(
          color: AppColors.titleTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: 'Sura Name',
        hintStyle: GoogleFonts.badScript(
            color: AppColors.titleTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.quranIconSearch),
          color: AppColors.primaryColor,
        ),
        fillColor: AppColors.secondaryColor.withValues(alpha: .5),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primaryColor)),
      ),
    );

    //   Row(
    //   children: [
    //     Image(image: AssetImage(AppAssets.quranIconSearch)),
    //     Text('Sura Name'),
    //
    //
    //   ],
    // );
  }
}
