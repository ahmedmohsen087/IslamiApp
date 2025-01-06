
import 'package:flutter/material.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class CompassWithQiblah extends StatelessWidget {
  const CompassWithQiblah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qiblah"),
      ),
      body: Center(
        child: SmoothCompass(
          isQiblahCompass: true,
          compassBuilder: (context, snapshot, child) {
            print( snapshot?.data?.qiblahOffset);
            return AnimatedRotation(
              turns: snapshot?.data?.turns??0/360,
              duration: const Duration(milliseconds: 400),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  children: [
                    //put your compass here
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/compass.png",
                        fit: BoxFit.fill,
                      ),
                    ),

                    //put your qiblah needle here
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: AnimatedRotation(
                        turns: (snapshot?.data?.qiblahOffset??0)/360,
                        duration: const Duration(milliseconds: 400),
                        child: Image.asset(
                          "assets/images/needle.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}