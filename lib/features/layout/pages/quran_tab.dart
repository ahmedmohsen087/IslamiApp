import 'package:flutter/material.dart';
import 'package:islamic/core/constants/app_assets.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.quranBackground), fit: BoxFit.cover),
      ),
    );
  }
}
