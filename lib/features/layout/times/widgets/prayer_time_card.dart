import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamic/core/constants/app_assets.dart';
import 'package:islamic/core/theme/aap_colors.dart';

import '../../../../api/api_manger.dart';
import '../../../../models/prayer_time_response_model.dart';

class PrayerTimeCard extends StatelessWidget {
  const PrayerTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return FutureBuilder<PrayerTimeResponseModel>(
      future: ApiManger.getPrayerTime(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),

          );
        } else if (snapshot.hasError){
          return Center(
            child: Column(
              children: [
                Text('Something Went Wrong',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor
                  ),
                ),
                ElevatedButton(onPressed: (){
                  ApiManger.getPrayerTime();
                }, child: Text('Try Again',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor
                  ),
                ),)
              ],
            ),
          );
        }
        PrayerTimeResponseModel data = snapshot.data! ;
        Map < String , dynamic > prayersTime = data.data!.timings!.toJson() ;
        final nextPrayer = getNextPrayer(prayersTime);

        return Stack(
            children: [
              Image.asset(AppAssets.azkarCard1),
              Image.asset(AppAssets.azkarCard2),
              Column(
                spacing: 20,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${data.data!.date!.gregorian!.day}-${data.data!.date!.gregorian!.month!.en} \n  ${data.data!.date!.gregorian!.year}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white
                          ),
                        ),
                        Text('Pray Time \n \n  ${data.data!.date!.gregorian!.weekday!.en}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        Text('${data.data!.date!.hijri!.day}-${data.data!.date!.hijri!.month!.ar} \n  ${data.data!.date!.hijri!.year}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white
                          ),
                        ),

                      ],
                    ),

                  ),
                  CarouselSlider.builder(
                    itemCount: prayersTime.length,
                    itemBuilder: (context, index, realIndex) {
                      final time = prayersTime.values.elementAt(index).toString();
                      final pray = prayersTime.keys.elementAt(index).toString();

                      return  Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.black,
                              AppColors.primaryColor
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(pray,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            Text(formatTime12(time),
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            Text(getAmPm(time),
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      enlargeFactor: 0.12,
                      height: size.height*.15,
                      viewportFraction: .30,
                      enlargeCenterPage: true,
                    ),
                  ),


                  Text(
                    'Next Prayer: ${nextPrayer['name']} - ${formatTime12(nextPrayer['time']!)} ${getAmPm(nextPrayer['time']!)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),

            ]
        );

      },);
  }
  String getAmPm(String time) {
    final hour = int.parse(time.split(":")[0]);
    return hour >= 12 ? "PM" : "AM";
  }

  String formatTime12(String time) {
    final parts = time.split(":");
    int hour = int.parse(parts[0]);
    final minute = parts[1];

    hour = hour % 12;
    if (hour == 0) hour = 12;

    return "$hour:$minute ";
  }
}
Map<String, String> getNextPrayer(Map<String, dynamic> prayers) {
  final now = DateTime.now();

  // ترتيب الصلوات
  final ordered = [
    'Fajr',
    'Dhuhr',
    'Asr',
    'Maghrib',
    'Isha',
  ];

  for (var prayer in ordered) {
    if (!prayers.containsKey(prayer)) continue;

    final rawTime = prayers[prayer].toString();

    // تنظيف (EET)
    final cleanTime = rawTime.split(" ").first;

    final parts = cleanTime.split(":");
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    final prayerDate = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (prayerDate.isAfter(now)) {
      return {
        "name": prayer,
        "time": cleanTime,
      };
    }
  }

  // لو اليوم خلص → فجر بكرة
  final fajrTime = prayers['Fajr'].toString().split(" ").first;
  return {
    "name": "Fajr",
    "time": fajrTime,
  };
}