import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:game_buzz/views/see_full_blog_screen.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'detailed_coverage_screen.dart';
import 'news_details_screen.dart';
import 'see_more_screen.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: Get.size.height * 0.40,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return CustomScoreTile(
                  onPress: () {},
                );
                /*new Image.network(
                  "http://via.placeholder.com/288x188",
                  fit: BoxFit.fill,
                );*/
              },
              pagination: SwiperPagination(),
              // control: SwiperControl(),
              itemCount: 6,
              viewportFraction: 0.9,
              scale: 0.95,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "MORE CRICKET",
                      style: TextStyle(fontSize: 10),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Get.theme.primaryColor,
                    ),
                  ],
                ),
                onPressed: () {},
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCategoryTile(
                  title: "Detailed Coverage",
                  onTap: () {},
                ),
                Container(
                  // padding: EdgeInsets.only(left: 8),
                  height: Get.size.height * 0.15,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return _verticalButton(
                          title: "ind vs Aus",
                          icon: Icons.sports_cricket,
                          onTap: () {
                            Get.to(DetailedCoverageScreen());
                          });
                    },
                  ),
                ),
                //Featured Video------------------------------------------------
                CustomCategoryTile(
                  title: "Featured Videos",
                  trailing: "SEE MORE",
                  onTap: () {
                    Get.to(SeeMoreScreen(
                      title: "Featured Videos",
                    ));
                  },
                ),
                Container(
                  // padding: EdgeInsets.only(left: 8),
                  height: Get.size.height * 0.28,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return CustomNewsTile(
                        style: 2,
                        onPress: () {
                          Get.to(NewsDetailsScreen());
                        },
                        isVideo: true,
                      );
                    },
                  ),
                ),
                //News----------------------------------------------------------
                CustomCategoryTile(
                  title: "Australia vs India News",
                  trailing: "SEE MORE",
                  onTap: () {
                    Get.to(SeeMoreScreen(
                      title: "Australia vs India News",
                    ));
                  },
                ),
                Container(
                  // padding: EdgeInsets.only(left: 8),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return CustomNewsTile(
                        style: index == 0 ? 1 : 3,
                        isVideo: true,
                        onPress: () {
                          Get.to(NewsDetailsScreen());
                        },
                      );
                    },
                  ),
                ),
                //Live updated timeline-----------------------------------------

                ListTile(
                  title: Row(
                    children: [
                      SpinKitRipple(
                        color: Get.theme.primaryColor,
                        size: 32,
                        /*
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.blue : Colors.red,
                          ),
                        );
                      },*/
                      ),
                      Text(
                        "Live Updates",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "10 min ago",
                        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 10),
                      ),
                    ],
                  ),
                  // title:
                  trailing: Text(
                    "SEE FULL BLOG",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.theme.primaryColor),
                  ),
                  dense: true,
                  onTap: () {
                    Get.to(SeeFullBlogScreen(
                      title: "SEE FULL BLOG",
                    ));
                  },
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: ClampingScrollPhysics(),
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
                        endChild: ListTile(
                          title: Text("Strac off to a superb start"),
                          subtitle: Text("12 pm"),
                          trailing: Icon(Icons.chevron_right),
                          dense: true,
                          onTap: () {
                            Get.to(NewsDetailsScreen());
                          },
                        ),
                      );
                    },
                  ),
                ),
                //Trending------------------------------------------------------

                CustomCategoryTile(
                  title: "Trending",
                  trailing: "SEE MORE",
                  onTap: () {},
                ),
                Container(
                  // padding: EdgeInsets.only(left: 8),
                  height: Get.size.height * 0.28,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return CustomNewsTile(
                        style: 2,
                        isVideo: true,
                        onPress: () {
                          Get.to(NewsDetailsScreen());
                        },
                      );
                    },
                  ),
                ),
                //Cricket News--------------------------------------------------
                CustomCategoryTile(
                  title: "Cricket News",
                  trailing: "SEE MORE",
                  onTap: () {},
                ),
                Container(
                  // padding: EdgeInsets.only(left: 8),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return CustomNewsTile(
                          style: index == 0 ? 1 : 3,
                          isVideo: index == 0 ? true : false,
                          onPress: () {
                            Get.to(NewsDetailsScreen());
                          },
                        );
                      }),
                ),
                //Football News-------------------------------------------------
                CustomCategoryTile(
                  title: "Football News",
                  trailing: "SEE MORE",
                  onTap: () {},
                ),
                Container(
                  // padding: EdgeInsets.only(left: 8),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return CustomNewsTile(
                          style: index == 0 ? 1 : 3,
                          isVideo: index == 0 ? true : false,
                          onPress: () {
                            Get.to(NewsDetailsScreen());
                          },
                        );
                      }),
                ),
                //Cricket videos------------------------------------------------------
                CustomCategoryTile(
                  title: "Cricket Videos",
                  trailing: "SEE MORE",
                  onTap: () {},
                ),
                Container(
                  // padding: EdgeInsets.only(left: 8),
                  height: Get.size.height * 0.28,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return CustomNewsTile(
                          style: 2,
                          isVideo: index == 0 ? true : false,
                          onPress: () {
                            Get.to(NewsDetailsScreen());
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _verticalButton({String title, IconData icon, Function onTap}) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Get.theme.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              // color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Icon(icon ?? Icons.developer_board),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title ?? "India",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

