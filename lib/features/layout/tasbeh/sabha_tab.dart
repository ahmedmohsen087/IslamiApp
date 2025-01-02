import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/core/theme/aap_colors.dart';

class SabhaTab extends StatefulWidget {
  SabhaTab({super.key});

  @override
  State<SabhaTab> createState() => _SabhaTabState();
}

class _SabhaTabState extends State<SabhaTab> {
  int counter = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.sabhaBackground), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100, child: Image.asset(AppAssets.quranLogo)),
          SizedBox(
              height: 73, child: Image(image: AssetImage(AppAssets.sabhaIcon))),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: onTsbaehTab,
                child: Transform.rotate(
                    angle: angle,
                    child: Image(image: AssetImage(AppAssets.sabhaLogo))),
              ),
              Text('سبحان الله  \n \n ',
                  style: GoogleFonts.ruwudu(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white)),
              Text(counter.toString(),
                  style: GoogleFonts.ruwudu(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white)),
            ],
          ),
        ],
      ),
    );
  }

  void onTsbaehTab() {
    counter++;
    if (counter == 33) {
      counter = 0;
    }

    angle += 1 / 33;
    setState(() {});
  }
}
