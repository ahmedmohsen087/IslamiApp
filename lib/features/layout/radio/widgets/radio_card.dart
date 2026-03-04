import 'package:flutter/material.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/provider/radio_manger_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/aap_colors.dart';
import '../../../../models/radio_response_model.dart';

class RadioCard extends StatelessWidget {
  final Radios model;

  const RadioCard({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioMangerProvider>(
      builder: (BuildContext context, RadioMangerProvider provider, Widget? child) {
        return Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      provider.play(model.url!);
                    },
                    icon: provider.currentPlayingUrl == model.url?
                    Icon(Icons.pause) : Icon(Icons.play_arrow) ,
                  ),
                  IconButton(
                    onPressed: () {
                      provider.stop();
                    },
                    icon: const Icon(Icons.stop),
                  ),
                  IconButton(
                    onPressed: () {
                      if (provider.currentVolume > 0) {
                        provider.setVolume(0); 
                      } else {
                        provider.setVolume(1);
                      }
                    },
                    icon: Icon(
                      provider.currentVolume > 0
                          ? Icons.volume_up
                          : Icons.volume_off,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}