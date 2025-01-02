import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/core/theme/aap_colors.dart';
import 'package:islamic/features/layout/quran/pages/quran_details_view.dart';
import 'package:islamic/features/layout/quran/pages/search_bar.dart';
import 'package:islamic/features/layout/quran/widgets/quran_most_recently.dart';
import 'package:islamic/features/layout/quran/widgets/sura_name_card.dart';
import 'package:islamic/models/recent_data.dart';
import 'package:islamic/models/sura_data_model.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  List<RecentData> recentDataList = [
    RecentData(
        suraNameAR: 'الأنبياء', suraNameEn: 'Al-Anbiya', suraVerses: '112'),
    RecentData(suraNameAR: 'الفاتحه', suraNameEn: 'Al-Fatiha', suraVerses: '7'),
    RecentData(
        suraNameAR: 'البقرة', suraNameEn: 'Al-Baqarah', suraVerses: '286'),
  ];

  List<String> suraNameAr = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  List<String> suraNameEn = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];
  List<String> suraVerses = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];

  List<SuraDataModel> suraList = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.quranBackground), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100, child: Image.asset(AppAssets.quranLogo)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: QuranSearchBar(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Text(
                'Most Recently ',
                textAlign: TextAlign.start,
                style: GoogleFonts.badScript(
                  textStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 155,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => QuranMostRecently(
                        recentData: recentDataList[index],
                      ),
                  itemCount: recentDataList.length),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Text(
                'Suras List ',
                textAlign: TextAlign.start,
                style: GoogleFonts.badScript(
                  textStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          QuranDetailsView.routeName,
                          arguments: suraList[index],
                        );
                        //  arguments: suraNameAr[index]);
                      },
                      child: SuraNameCard(
                        suraDataModel: suraList[index],
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(
                      indent: 40,
                      endIndent: 40,
                    ),
                itemCount: suraList.length)
          ],
        ),
      ),
    );
  }
}
