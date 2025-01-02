import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/core/theme/aap_colors.dart';
import 'package:islamic/models/sura_data_model.dart';

class QuranDetailsView extends StatefulWidget {
  static const routeName = 'QuranDetailsView';

  QuranDetailsView({
    super.key,
  });

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDataModel;
    if (versesList.isEmpty) loadData(args.number);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.souraDetails), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          title: Text(
            args.nameEn,
            style: GoogleFonts.badScript(
              textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                args.nameAr,
                textAlign: TextAlign.center,
                style: GoogleFonts.ruwudu(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => Text(
                  '${versesList[index]}-(${index + 1})',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                itemCount: versesList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  void loadData(suraId) async {
    String contant =
        await rootBundle.loadString('assets/files/Suras/$suraId.txt');
    setState(() {
      versesList = contant.split('\n');
    });
  }
}
