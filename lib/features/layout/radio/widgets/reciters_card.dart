import 'package:flutter/material.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/features/layout/radio/widgets/reciter_details_page.dart';
import '../../../../core/theme/aap_colors.dart';
import '../../../../models/reciters_response_model.dart';

class RecitersCard extends StatelessWidget {
  final Reciters model;

  const RecitersCard({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ReciterDetailsPage(reciter: model),
          ),
        );

      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage(AppAssets.radioCard1),
          ),
          borderRadius:  BorderRadius.circular(20),
          color: AppColors.primaryColor,
        ),
        child: Column(
          children: [
            Text(
              model.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}