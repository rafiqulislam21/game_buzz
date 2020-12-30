import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class SeeMoreScreen extends StatelessWidget {
  final String title;

  const SeeMoreScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title??'title'.tr),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
                Icons.sports_cricket,
                color: Get.theme.primaryColor,
              ),
          )
        ],
      ),
      body:  Container(
        child: Scrollbar(
          radius: Radius.circular(5),
          thickness: 3,
          child: ListView(
            // shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0),
            children: [
              CustomNewsTile(
                style: 1,
                isVideo: true,
                onPress: () {},
              ),
              CustomNewsTile(
                style: 3,
                isVideo: true,
                onPress: () {},
              ),
              CustomNewsTile(
                style: 3,
                onPress: () {},
              ),
              CustomNewsTile(
                style: 3,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

}
