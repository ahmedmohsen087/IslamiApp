import 'package:flutter/material.dart';
import 'package:islamic/core/theme/aap_colors.dart';
import 'package:islamic/features/layout/times/pages/evening_azkar.dart';

class AzkarCard extends StatelessWidget {
  final String title ;
  final String image;
   const AzkarCard({
    required this.title,
    required this.image,
    super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Expanded(
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EveningAzkar(sectionName: title,),
            ),
          ); },
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 2,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Image.asset(image,
                  height: size.height*.2,
                ),
                Text(title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
