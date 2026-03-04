import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/models/azkar_model.dart';
import '../../../../core/constants/app_assets.dart';
import 'azka_item_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EveningAzkar extends StatefulWidget {
  final String sectionName;

  const EveningAzkar({required this.sectionName, super.key});

  @override
  State<EveningAzkar> createState() => _EveningAzkarState();
}

class _EveningAzkarState extends State<EveningAzkar> {
  List<AzkarModel> azkarList = [];

  @override
  void initState() {
    super.initState();
    loadAzkar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sectionName)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.hadithBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(AppAssets.quranLogo),
            ),
            Expanded(
              child: azkarList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : CarouselSlider(
                items: azkarList
                    .map((e) => AzkarItemCard(azkar: e))
                    .toList(),
                options: CarouselOptions(
                  aspectRatio: .7,
                  viewportFraction: .8,
                  enlargeCenterPage: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadAzkar() async {
    try {
      String jsonString =
      await rootBundle.loadString('assets/files/azkar.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      AzkarModel fullData = AzkarModel.fromFullJson(jsonData);

      setState(() {
        azkarList = fullData.sections?[widget.sectionName] ?? [];
      });
    } catch (e) {
      debugPrint("Error loading azkar: $e");
    }
  }
}