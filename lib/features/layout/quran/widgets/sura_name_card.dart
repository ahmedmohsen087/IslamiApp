import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/constants/app_assets.dart';

import '../../../../core/theme/aap_colors.dart';
import '../../../../models/sura_data_model.dart';

class SuraNameCard extends StatelessWidget {
  final SuraDataModel suraDataModel;

  const SuraNameCard({
    super.key,
    required this.suraDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.suraIcon,
                ),
              ),
            ),
            child: Text(
              suraDataModel.number.toString(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraDataModel.nameEn,
                textAlign: TextAlign.start,
                style: GoogleFonts.badScript(
                  textStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${suraDataModel.verses} Verses  ',
                textAlign: TextAlign.start,
                style: GoogleFonts.badScript(
                  textStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraDataModel.nameAr,
            textAlign: TextAlign.start,
            style: GoogleFonts.ruwudu(
              textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
