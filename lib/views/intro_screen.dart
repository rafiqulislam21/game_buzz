import 'package:game_buzz/views/home_screen.dart';
import 'package:game_buzz/views/welcome_screen.dart';
import 'package:game_buzz/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List sportList = ['Cricket', 'Football', 'Basketball', 'NFL'];
  List<String> filters = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.size.height * 0.25),
          child: AppBar(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(100,10),
                ),
              ),
              backgroundColor: Get.theme.primaryColor,
              flexibleSpace: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(onPressed: () {}, child: Text("Skip"))
                    ],
                  ),
                  ListTile(
                    title: Text(
                      "Let's Get To Know \nThe Game Buzz",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Select sports you are crazy about"),
                    trailing: Icon(
                      Icons.emoji_people,
                      size: 100,
                    ),
                  )
                ],
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: sportList.map((item) {
                  return CustomFilterChip(
                    chipName: item,
                    onSelect: (val) {
                      if (val) {
                        filters.add(item);
                      } else {
                        filters.removeWhere((String name) {
                          return name == item;
                        });
                      }

                      // print(filters);
                    },
                    isSelected: filters.contains(item),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "NEXT",
                color: Get.theme.buttonColor,
                textColor: Colors.white,
                elevation: 5,
                borderRadius: 40,
                fontSize: 14,
                onPressed: () {
                  Get.offAll(HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sportsCard({String title}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RawMaterialButton(
        child: Container(
            height: 150,
            width: Get.size.width * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("assets/img/cricket.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.black87,
                        ],
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title ?? "",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )),
        onPressed: () {},
      ),
    );
  }
}
