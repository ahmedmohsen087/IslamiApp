import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islamic/models/radio_response_model.dart';
import 'package:islamic/models/reciters_response_model.dart';

import '../models/prayer_time_response_model.dart';

class ApiManger {
  static Future<RadioResponseModel> getRadioData() async{
    try {
      Uri uri = Uri.parse('https://www.mp3quran.net/api/v3/radios?language=ar');
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RadioResponseModel.fromJson(jsonResponse);
    }catch (e){
      rethrow;
    }
  }

  static Future<RecitersResponseModel> getRecitersData() async{
    try {
      Uri uri = Uri.parse('https://www.mp3quran.net/api/v3/reciters?language=ar');
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RecitersResponseModel.fromJson(jsonResponse);
    }catch (e){
      rethrow;
    }
  }

  static Future<PrayerTimeResponseModel> getPrayerTime() async{
    try {
      String date = DateFormat('dd-MM-yyyy').format(DateTime.now()) ;
      Uri uri = Uri.parse('https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt') ;
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return PrayerTimeResponseModel.fromJson(jsonResponse);
    }catch (e){
      rethrow;
    }
  }
}



