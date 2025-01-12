import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../models/hadith_data_model.dart';
import '../widgets/hadith_item_card.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithDataModel> hadithList = [];

  @override
  void initState() {
    super.initState();
    loadAllHadiths();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.hadithBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100, child: Image.asset(AppAssets.quranLogo)),
          Expanded(
            child: hadithList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : CarouselSlider(
              items: hadithList
                  .map((e) => HadithItemCard(hadithData: e))
                  .toList(),
              options: CarouselOptions(
                aspectRatio: .7,
                viewportFraction: .68,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration:
                const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadAllHadiths() async {
    List<HadithDataModel> tempList = [];

    try {
      for (int i = 1; i <= 50; i++) {
        String fileName = 'assets/files/Hadeeth/h$i.txt';
        String content = await rootBundle.loadString(fileName);

        int index = content.indexOf('\n');
        if (index == -1) {
          tempList.add(HadithDataModel(title: "عنوان غير معروف", content: content.trim()));
        } else {
          String title = content.substring(0, index).trim();
          String body = content.substring(index + 1).trim();
          tempList.add(HadithDataModel(title: title, content: body));
        }
      }

      setState(() {
        hadithList = tempList;
      });
    } catch (e) {
      print("Error loading hadith files: $e");
    }
  }
}
