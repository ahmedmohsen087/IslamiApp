import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/models/sura_data_model.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../models/hadith_data_model.dart';
import '../widgets/hadith_item_card.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithDataModel> hadithList = [];



  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty)loadData(hadithList.length);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.hadithBackground), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100, child: Image.asset(AppAssets.quranLogo)),
          Expanded(
            child: CarouselSlider(
                items: hadithList.map((e) =>
                HadithItemCard(
                  hadithData: e,

                )).toList(),
                options: CarouselOptions(
                  aspectRatio: .7,
                  viewportFraction: .68,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
          )
        ],
      ),
    );
  }

  void loadData(suraId) async {
    String contant =
        await rootBundle.loadString('assets/files/Hadeeth/$suraId.txt');
      List<String> hadithList = contant.split('\n');

      for( var element in hadithList){
        String singleHadith = element.trim();
        int index = singleHadith.indexOf('\n');

        String hadithTitle = singleHadith.substring(0, index);
        String hadithContant = singleHadith.substring(index + 1, );

        var hadithData = HadithDataModel(
            title: hadithTitle ,
            content: hadithContant
        );
        hadithList.add(hadithData as String );
        setState(() {

        });

      }
  }
}
