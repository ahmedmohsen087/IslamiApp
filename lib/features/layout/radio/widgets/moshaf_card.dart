import 'package:flutter/material.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/features/layout/radio/widgets/sura_name.dart';
import 'package:islamic/provider/radio_manger_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/aap_colors.dart';
import '../../../../models/reciters_response_model.dart';

class MoshafCard extends StatelessWidget {
  final Reciters reciter;
  final int moshafIndex;

  const MoshafCard({
    required this.reciter,
    required this.moshafIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final moshaf = reciter.moshaf![moshafIndex];
    final surahNumbers = moshaf.surahList?.split(',') ?? [];

    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            moshaf.name ?? "",
            style:  TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: surahNumbers.length,
            itemBuilder: (context, index) {
              final surahNumber = int.tryParse(surahNumbers[index]);
              final surahName = surahNumber != null
                  ? SurahNames.getName(surahNumber)
                  : surahNumbers[index];

              return Consumer<RadioMangerProvider>(
                builder: (context, provider, child) {
                  final audioUrl = _buildAudioUrl(moshaf, surahNumbers[index]);
                  final isPlaying = provider.currentPlayingUrl == audioUrl;

                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.radioCard1),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            surahName,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                          onPressed: () {
                            if (isPlaying) {
                              provider.stop();
                            } else {
                              provider.play(audioUrl);
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(provider.currentVolume > 0
                              ? Icons.volume_up
                              : Icons.volume_off),
                          onPressed: () {
                            if (provider.currentVolume > 0) {
                              provider.setVolume(0);
                            } else {
                              provider.setVolume(1);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.stop),
                          onPressed: () {
                            provider.stop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  String _buildAudioUrl(Moshaf moshaf, String surahNumber) {
    final server = moshaf.server;
    if (server == null) return "";
    final padded = surahNumber.padLeft(3, '0'); 
    return "$server$padded.mp3";
  }
}