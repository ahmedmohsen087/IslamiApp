class AzkarModel {
  final String category;
  final int count;
  final String description;
  final String reference;
  final String content;

  // للقسم الرئيسي (أذكار الصباح - المساء ...)
  final Map<String, List<AzkarModel>>? sections;

  AzkarModel({
    this.category = '',
    this.count = 0,
    this.description = '',
    this.reference = '',
    this.content = '',
    this.sections,
  });

  /// Constructor للذكر الواحد
  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      category: json['category'] ?? '',
      count: int.tryParse(json['count'].toString()) ?? 0,
      description: json['description'] ?? '',
      reference: json['reference'] ?? '',
      content: json['content'] ?? '',
    );
  }

  /// Constructor للملف كله
  factory AzkarModel.fromFullJson(Map<String, dynamic> json) {
    Map<String, List<AzkarModel>> parsedSections = {};

    json.forEach((key, value) {
      List<AzkarModel> azkarList = [];

      void processItem(dynamic item) {
        if (item is List) {
          for (var subItem in item) {
            processItem(subItem);
          }
        } else if (item is Map<String, dynamic>) {
          final azkar = AzkarModel.fromJson(item);
          // بدل ما نرفض count = 0 أو غير صالح، نخليه 1 افتراضياً
          if (azkar.content.isNotEmpty) {
            azkarList.add(AzkarModel(
              category: azkar.category,
              count: azkar.count > 0 ? azkar.count : 1, // افتراضي 1
              description: azkar.description,
              reference: azkar.reference,
              content: azkar.content,
            ));
          }
        }
      }

      processItem(value);
      parsedSections[key] = azkarList;
    });

    return AzkarModel(sections: parsedSections);
  }}