import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/models/sura_data_model.dart';

import '../../../../core/constants/app_assets.dart';
import '../widgets/hadith_item_card.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<SuraDataModel> items = [
    SuraDataModel(number: 1, nameAr: "الفاتحه", nameEn: "Al-Fatiha", verses: 7),
    SuraDataModel(
        number: 2, nameAr: "البقرة", nameEn: "Al-Baqarah", verses: 286),
    SuraDataModel(
        number: 3, nameAr: "آل عمران", nameEn: "Aal-E-Imran", verses: 200),
    SuraDataModel(number: 4, nameAr: "النساء", nameEn: "An-Nisa'", verses: 176),
    SuraDataModel(
        number: 5, nameAr: "المائدة", nameEn: "Al-Ma'idah", verses: 120),
    SuraDataModel(
        number: 6, nameAr: "الأنعام", nameEn: "Al-An'am", verses: 165),
    SuraDataModel(
        number: 7, nameAr: "الأعراف", nameEn: "Al-A'raf", verses: 206),
    SuraDataModel(number: 8, nameAr: "الأنفال", nameEn: "Al-Anfal", verses: 75),
    SuraDataModel(
        number: 9, nameAr: "التوبة", nameEn: "At-Tawbah", verses: 129),
    SuraDataModel(number: 10, nameAr: "يونس", nameEn: "Yunus", verses: 109),
    SuraDataModel(number: 11, nameAr: "هود", nameEn: "Hud", verses: 123),
    SuraDataModel(number: 12, nameAr: "يوسف", nameEn: "Yusuf", verses: 111),
    SuraDataModel(number: 13, nameAr: "الرعد", nameEn: "Ar-Ra'd", verses: 43),
    SuraDataModel(number: 14, nameAr: "إبراهيم", nameEn: "Ibrahim", verses: 52),
    SuraDataModel(number: 15, nameAr: "الحجر", nameEn: "Al-Hijr", verses: 99),
    SuraDataModel(number: 16, nameAr: "النحل", nameEn: "An-Nahl", verses: 128),
    SuraDataModel(
        number: 17, nameAr: "الإسراء", nameEn: "Al-Isra", verses: 111),
    SuraDataModel(number: 18, nameAr: "الكهف", nameEn: "Al-Kahf", verses: 110),
    SuraDataModel(number: 19, nameAr: "مريم", nameEn: "Maryam", verses: 98),
    SuraDataModel(number: 20, nameAr: "طه", nameEn: "Ta-Ha", verses: 135),
    SuraDataModel(
        number: 21, nameAr: "الأنبياء", nameEn: "Al-Anbiya", verses: 112),
    SuraDataModel(number: 22, nameAr: "الحج", nameEn: "Al-Hajj", verses: 78),
    SuraDataModel(
        number: 23, nameAr: "المؤمنون", nameEn: "Al-Mu'minun", verses: 118),
    SuraDataModel(number: 24, nameAr: "النور", nameEn: "An-Nur", verses: 64),
    SuraDataModel(
        number: 25, nameAr: "الفرقان", nameEn: "Al-Furqan", verses: 77),
    SuraDataModel(
        number: 26, nameAr: "الشعراء", nameEn: "Ash-Shu'ara", verses: 227),
    SuraDataModel(number: 27, nameAr: "النمل", nameEn: "An-Naml", verses: 93),
    SuraDataModel(number: 28, nameAr: "القصص", nameEn: "Al-Qasas", verses: 88),
    SuraDataModel(
        number: 29, nameAr: "العنكبوت", nameEn: "Al-Ankabut", verses: 69),
    SuraDataModel(number: 30, nameAr: "الروم", nameEn: "Ar-Rum", verses: 60),
    SuraDataModel(number: 31, nameAr: "لقمان", nameEn: "Luqman", verses: 34),
    SuraDataModel(number: 32, nameAr: "السجدة", nameEn: "As-Sajda", verses: 30),
    SuraDataModel(
        number: 33, nameAr: "الأحزاب", nameEn: "Al-Ahzab", verses: 73),
    SuraDataModel(number: 34, nameAr: "سبأ", nameEn: "Saba", verses: 54),
    SuraDataModel(number: 35, nameAr: "فاطر", nameEn: "Fatir", verses: 45),
    SuraDataModel(number: 36, nameAr: "يس", nameEn: "Ya-Sin", verses: 83),
    SuraDataModel(
        number: 37, nameAr: "الصافات", nameEn: "As-Saffat", verses: 182),
    SuraDataModel(number: 38, nameAr: "ص", nameEn: "Sad", verses: 88),
    SuraDataModel(number: 39, nameAr: "الزمر", nameEn: "Az-Zumar", verses: 75),
    SuraDataModel(number: 40, nameAr: "غافر", nameEn: "Ghafir", verses: 85),
    SuraDataModel(number: 41, nameAr: "فصّلت", nameEn: "Fussilat", verses: 54),
    SuraDataModel(
        number: 42, nameAr: "الشورى", nameEn: "Ash-Shura", verses: 53),
    SuraDataModel(
        number: 43, nameAr: "الزخرف", nameEn: "Az-Zukhruf", verses: 89),
    SuraDataModel(
        number: 44, nameAr: "الدخان", nameEn: "Ad-Dukhan", verses: 59),
    SuraDataModel(
        number: 45, nameAr: "الجاثية", nameEn: "Al-Jathiya", verses: 37),
    SuraDataModel(
        number: 46, nameAr: "الأحقاف", nameEn: "Al-Ahqaf", verses: 35),
    SuraDataModel(number: 47, nameAr: "محمد", nameEn: "Muhammad", verses: 38),
    SuraDataModel(number: 48, nameAr: "الفتح", nameEn: "Al-Fath", verses: 29),
    SuraDataModel(
        number: 49, nameAr: "الحجرات", nameEn: "Al-Hujurat", verses: 18),
    SuraDataModel(number: 50, nameAr: "ق", nameEn: "Qaf", verses: 45),
    SuraDataModel(
        number: 51, nameAr: "الذاريات", nameEn: "Adh-Dhariyat", verses: 60),
    SuraDataModel(number: 52, nameAr: "الطور", nameEn: "At-Tur", verses: 49),
    SuraDataModel(number: 53, nameAr: "النجم", nameEn: "An-Najm", verses: 62),
    SuraDataModel(number: 54, nameAr: "القمر", nameEn: "Al-Qamar", verses: 55),
    SuraDataModel(
        number: 55, nameAr: "الرحمن", nameEn: "Ar-Rahman", verses: 78),
    SuraDataModel(
        number: 56, nameAr: "الواقعة", nameEn: "Al-Waqia", verses: 96),
    SuraDataModel(number: 57, nameAr: "الحديد", nameEn: "Al-Hadid", verses: 29),
    SuraDataModel(
        number: 58, nameAr: "المجادلة", nameEn: "Al-Mujadila", verses: 22),
    SuraDataModel(number: 59, nameAr: "الحشر", nameEn: "Al-Hashr", verses: 24),
    SuraDataModel(
        number: 60, nameAr: "الممتحنة", nameEn: "Al-Mumtahina", verses: 13),
    SuraDataModel(number: 61, nameAr: "الصف", nameEn: "As-Saff", verses: 14),
    SuraDataModel(
        number: 62, nameAr: "الجمعة", nameEn: "Al-Jumu'a", verses: 11),
    SuraDataModel(
        number: 63, nameAr: "المنافقون", nameEn: "Al-Munafiqun", verses: 11),
    SuraDataModel(
        number: 64, nameAr: "التغابن", nameEn: "At-Taghabun", verses: 18),
    SuraDataModel(number: 65, nameAr: "الطلاق", nameEn: "At-Talaq", verses: 12),
    SuraDataModel(
        number: 66, nameAr: "التحريم", nameEn: "At-Tahrim", verses: 12),
    SuraDataModel(number: 67, nameAr: "الملك", nameEn: "Al-Mulk", verses: 30),
    SuraDataModel(number: 68, nameAr: "القلم", nameEn: "Al-Qalam", verses: 52),
    SuraDataModel(
        number: 69, nameAr: "الحاقة", nameEn: "Al-Haqqah", verses: 52),
    SuraDataModel(
        number: 70, nameAr: "المعارج", nameEn: "Al-Ma'arij", verses: 44),
    SuraDataModel(number: 71, nameAr: "نوح", nameEn: "Nuh", verses: 28),
    SuraDataModel(number: 72, nameAr: "الجن", nameEn: "Al-Jinn", verses: 28),
    SuraDataModel(
        number: 73, nameAr: "المزمل", nameEn: "Al-Muzzammil", verses: 20),
    SuraDataModel(
        number: 74, nameAr: "المدثر", nameEn: "Al-Muddathir", verses: 56),
    SuraDataModel(
        number: 75, nameAr: "القيامة", nameEn: "Al-Qiyama", verses: 40),
    SuraDataModel(
        number: 76, nameAr: "الإنسان", nameEn: "Al-Insan", verses: 31),
    SuraDataModel(
        number: 77, nameAr: "المرسلات", nameEn: "Al-Mursalat", verses: 50),
    SuraDataModel(number: 78, nameAr: "النبأ", nameEn: "An-Naba'", verses: 40),
    SuraDataModel(
        number: 79, nameAr: "النازعات", nameEn: "An-Nazi'at", verses: 46),
    SuraDataModel(number: 80, nameAr: "عبس", nameEn: "Abasa", verses: 42),
    SuraDataModel(
        number: 81, nameAr: "التكوير", nameEn: "At-Takwir", verses: 29),
    SuraDataModel(
        number: 82, nameAr: "الإنفطار", nameEn: "Al-Infitar", verses: 19),
    SuraDataModel(
        number: 83, nameAr: "المطففين", nameEn: "Al-Mutaffifin", verses: 36),
    SuraDataModel(
        number: 84, nameAr: "الإنشقاق", nameEn: "Al-Inshiqaq", verses: 25),
    SuraDataModel(number: 85, nameAr: "البروج", nameEn: "Al-Buruj", verses: 22),
    SuraDataModel(number: 87, nameAr: "الأعلى", nameEn: "Al-A'la", verses: 19),
    SuraDataModel(
        number: 88, nameAr: "الغاشية", nameEn: "Al-Ghashiyah", verses: 26),
    SuraDataModel(number: 89, nameAr: "الفجر", nameEn: "Al-Fajr", verses: 30),
    SuraDataModel(number: 90, nameAr: "البلد", nameEn: "Al-Balad", verses: 20),
    SuraDataModel(number: 91, nameAr: "الشمس", nameEn: "Ash-Shams", verses: 15),
    SuraDataModel(number: 92, nameAr: "الليل", nameEn: "Al-Lail", verses: 21),
    SuraDataModel(number: 93, nameAr: "الضحى", nameEn: "Ad-Duha", verses: 11),
    SuraDataModel(number: 94, nameAr: "الشرح", nameEn: "Ash-Sharh", verses: 8),
    SuraDataModel(number: 95, nameAr: "التين", nameEn: "At-Tin", verses: 8),
    SuraDataModel(number: 96, nameAr: "العلق", nameEn: "Al-Alaq", verses: 19),
    SuraDataModel(number: 97, nameAr: "القدر", nameEn: "Al-Qadr", verses: 5),
    SuraDataModel(
        number: 98, nameAr: "البينة", nameEn: "Al-Bayyina", verses: 8),
    SuraDataModel(
        number: 99, nameAr: "الزلزلة", nameEn: "Az-Zalzalah", verses: 8),
    SuraDataModel(
        number: 100, nameAr: "العاديات", nameEn: "Al-Adiyat", verses: 11),
    SuraDataModel(
        number: 101, nameAr: "القارعة", nameEn: "Al-Qari'a", verses: 11),
    SuraDataModel(
        number: 102, nameAr: "التكاثر", nameEn: "At-Takathur", verses: 8),
    SuraDataModel(number: 103, nameAr: "العصر", nameEn: "Al-Asr", verses: 3),
    SuraDataModel(
        number: 104, nameAr: "الهمزة", nameEn: "Al-Humazah", verses: 9),
    SuraDataModel(number: 105, nameAr: "الفيل", nameEn: "Al-Fil", verses: 5),
    SuraDataModel(number: 106, nameAr: "قريش", nameEn: "Quraysh", verses: 4),
    SuraDataModel(
        number: 107, nameAr: "الماعون", nameEn: "Al-Ma'un", verses: 7),
    SuraDataModel(
        number: 108, nameAr: "الكوثر", nameEn: "Al-Kawthar", verses: 3),
    SuraDataModel(
        number: 109, nameAr: "الكافرون", nameEn: "Al-Kafirun", verses: 6),
    SuraDataModel(number: 110, nameAr: "النصر", nameEn: "An-Nasr", verses: 3),
    SuraDataModel(number: 111, nameAr: "المسد", nameEn: "Al-Masad", verses: 5),
    SuraDataModel(
        number: 112, nameAr: "الإخلاص", nameEn: "Al-Ikhlas", verses: 4),
    SuraDataModel(number: 113, nameAr: "الفلق", nameEn: "Al-Falaq", verses: 5),
    SuraDataModel(number: 114, nameAr: "الناس", nameEn: "An-Nas", verses: 6),
  ];
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
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
                items: items.map((item) => HadithItemCard()).toList(),
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.6,
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
    setState(() {
      List<String> hadithList = contant.split('\n');
    });
  }
}
