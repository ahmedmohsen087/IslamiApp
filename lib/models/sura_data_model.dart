class SuraDataModel {
  final int number;
  final String nameAr;
  final String nameEn;
  final int verses;

  SuraDataModel({
    required this.number,
    required this.nameAr,
    required this.nameEn,
    required this.verses,
  });

  @override
  String toString() {
    return 'Sura(number: $number, nameAr: $nameAr, nameEn: $nameEn, verses: $verses)';
  }
}
