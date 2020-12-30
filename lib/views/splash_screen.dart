import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'intro_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    /*Image.asset(
                      "assets/img/loader.gif",
                      fit: BoxFit.fitWidth,
                    ),*/
                    // Text("Logo",style: TextStyle(fontSize: 45),),
                    Icon(Icons.sports_cricket_outlined,size: 100, color: Get.theme.primaryColor,),
                    SizedBox(height: 10,),
                    SpinKitFadingCircle(
                      color: Get.theme.primaryColor,
                      /*
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.blue : Colors.red,
                          ),
                        );
                      },*/
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  initialize() async {
    await 4.delay();
    Get.off(
      // HomeScreen(),
        IntroScreen(),
      duration: Duration(seconds: 1),
      curve: Curves.easeInOutBack,
      // transition: Transition.rightToLeftWithFade,
    );
  }
}
