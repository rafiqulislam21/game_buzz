import 'package:game_buzz/views/home_screen.dart';
import 'package:game_buzz/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_page.dart';
import 'view_all_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.red[900], Colors.red[400]])),
        child: Stack(
          children: [
            Positioned(
                top: 80,
                left: -15,
                child: Icon(
                  Icons.album,
                  size: 60,
                  color: Get.theme.splashColor??Colors.red[100],
                )),
            Positioned(
                top: 10,
                left: 60,
                child: Icon(
                  Icons.adjust,
                  size: 50,
                  color: Get.theme.splashColor??Colors.green[100],
                )),
            Positioned(
                top: 10,
                right: 0,
                child: Icon(
                  Icons.album,
                  size: 80,
                  color: Get.theme.splashColor??Colors.blue[100],
                )),
            Positioned(
                top: 150,
                right: -25,
                child: Icon(
                  Icons.adjust,
                  size: 120,
                  color: Get.theme.splashColor??Colors.amber[100],
                )),
            Positioned(
                top: 250,
                left: -100,
                child: Icon(
                  Icons.album,
                  size: 220,
                  color: Get.theme.splashColor??Colors.amber[100],
                )),
            Positioned(
                bottom: 80,
                left: 40,
                child: Icon(
                  Icons.adjust,
                  size: 50,
                  color: Get.theme.splashColor??Colors.pink[100],
                )),
            Positioned(
                bottom: 100,
                right: 40,
                child: Icon(
                  Icons.adjust,
                  size: 40,
                  color: Get.theme.splashColor??Colors.red[100],
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: Icon(
                  Icons.adjust,
                  size: 30,
                  color: Get.theme.splashColor??Colors.purple[100],
                )),
            Positioned(
                bottom: -50,
                right: -50,
                child: Icon(
                  Icons.album,
                  size: 150,
                  color: Get.theme.splashColor??Colors.orange[100],
                )),
            Positioned(
                bottom: -10,
                left: 60,
                child: Icon(
                  Icons.album,
                  size: 100,
                  color: Get.theme.splashColor??Colors.green[100],
                )),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.mediation,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Welcome to D Point",
                        style: TextStyle(fontSize: 30, color: Colors.white,),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Allow us just 2 minutes to take you through our services and show yow you how its works",
                        style: TextStyle(fontSize: 18,color: Colors.white,),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: "TAKE A TOUR",
                        color: Colors.red[300],
                        textColor: Colors.white,
                        elevation: 5,
                        borderRadius: 40,
                        fontSize: 18,
                        icon: Icons.play_circle_fill,
                        onPressed: () {},
                      ),
                      FlatButton(
                        textColor: Colors.white,
                        child: Text("SKIP",style: TextStyle(fontSize: 18,color: Colors.white,),),
                        onPressed: () {
                          Get.offAll(HomeScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
