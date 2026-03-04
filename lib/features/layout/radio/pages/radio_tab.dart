import 'package:flutter/material.dart';
import 'package:islamic/features/layout/radio/widgets/reciters_card.dart';
import 'package:islamic/models/radio_response_model.dart';
import 'package:islamic/models/reciters_response_model.dart';
import '../../../../api/api_manger.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/aap_colors.dart';
import '../widgets/radio_card.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(
              AppAssets.quranLogo,
              height: 150,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTab(
                  title: "Radio",
                  index: 0,
                  width: size.width * .4,
                ),
                buildTab(
                  title: "Reciters",
                  index: 1,
                  width: size.width * .4,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: selectedIndex == 0
                  ? Center(
                child: FutureBuilder<RadioResponseModel>(
                    future: ApiManger.getRadioData(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Expanded(
                          child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),

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
                                ApiManger.getRadioData();
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
                      RadioResponseModel data = snapshot.data! ;
                      return ListView.builder(itemBuilder: (context, index) {

                        return RadioCard(model: data.radios![index]);
                      },
                        itemCount: data.radios?.length,
                      );
                    },
                ),
              )
                  : Center(
                child: FutureBuilder<RecitersResponseModel>(
                  future: ApiManger.getRecitersData(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),

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
                              ApiManger.getRadioData();
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
                    RecitersResponseModel data = snapshot.data! ;
                    return ListView.builder(itemBuilder: (context, index) {

                      return RecitersCard(model: data.reciters![index]);
                    },
                      itemCount: data.reciters?.length,
                    );
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab({
    required String title,
    required int index,
    required double width,
  }) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(10),
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.secondaryColor.withValues(alpha: 0.5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}