import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'widgets/widgets.dart';

class SeeFullBlogScreen extends StatelessWidget {
  final String title;

  const SeeFullBlogScreen({Key key, this.title}) : super(key: key);

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
        padding: EdgeInsets.only(left: 10),
        child: Scrollbar(
          radius: Radius.circular(5),
          thickness: 3,
          child:ListView.builder(
            padding: EdgeInsets.all(0),
            // shrinkWrap: true,
            itemCount: 5,
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return TimelineTile(
                alignment: TimelineAlign.start,
                isFirst: index == 0 ? true : false,
                isLast: index == 4 ? true : false,
                indicatorStyle: const IndicatorStyle(
                  // width: 25,
                    color: Color(0xffD3D3D3),
                    indicator: CircleAvatar(
                        backgroundColor: Color(0xffBDBDBD),
                        child: Icon(
                          Icons.announcement_outlined,
                          size: 12,
                          color: Colors.black,
                        ))),
                beforeLineStyle: const LineStyle(
                  color: Color(0xffD3D3D3),
                  thickness: 1,
                ),
                endChild: CustomNewsTile(
                  style: index == 0 ? 1 : 3,
                  isVideo: true,
                  onPress: () {},
                ),
              );
            },
          ),

          /*ListView(
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
          ),*/
        ),
      ),
    );
  }

}
