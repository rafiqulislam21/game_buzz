import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:game_buzz/views/see_full_blog_screen.dart';
import 'package:game_buzz/views/sports_tournament_list_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'detailed_coverage_screen.dart';
import 'individual_sports_screen.dart';
import 'news_details_screen.dart';
import 'see_more_screen.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      radius: Radius.circular(5),
      thickness: 3,
      child: SingleChildScrollView(
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
                  onPressed: () {
                    Get.to(SportsTournamentListScreen(
                      title: "Cricket",
                    ),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 400)
                    );
                  },
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
                        return Hero(
                          tag: "DetailedCoverage$index",
                          child: _verticalButton(
                              title: "ind vs Aus",
                              icon: Icons.sports_cricket,
                              onPressed: () {
                                Get.to(DetailedCoverageScreen(
                                  id: index,
                                  tag: "DetailedCoverage$index",
                                ));
                              }),
                        );
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
                      ),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 400)
                      );
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
                        return Hero(
                          tag: "FeaturedVideos$index",
                          child: CustomNewsTile(
                            style: 2,
                            onPress: () {
                              Get.to(NewsDetailsScreen(
                                id: index,
                                tag: "FeaturedVideos$index",
                              ));
                            },
                            isVideo: true,
                          ),
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
                      ),
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 400)
                      );
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
                        return Hero(
                          tag: "h2h$index",
                          child: CustomNewsTile(
                            style: index == 0 ? 1 : 3,
                            isVideo: true,
                            onPress: () {
                              Get.to(NewsDetailsScreen(
                                id: index,
                                tag: "h2h$index",
                              ));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  //Live updated timeline-----------------------------------------

                  ListTile(
                    title: Row(
                      children: [
                        Text(
                          "Live Updates",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SpinKitRipple(
                          // color: Colors.red,
                          size: 32,
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "10 min ago",
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 10),
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

                      ),transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 400)
                      );
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
                              Get.to(NewsDetailsScreen(
                                id: index,
                              ));
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
                        return Hero(
                          tag: "Trending$index",
                          child: CustomNewsTile(
                            style: 2,
                            isVideo: true,
                            onPress: () {
                              Get.to(NewsDetailsScreen(
                                id: index,
                                tag: "Trending$index",
                              ));
                            },
                          ),
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
                          return Hero(
                            tag: "CricketNews$index",
                            child: CustomNewsTile(
                              style: index == 0 ? 1 : 3,
                              isVideo: index == 0 ? true : false,
                              onPress: () {
                                Get.to(NewsDetailsScreen(
                                  id: index,
                                  tag: "CricketNews$index",
                                ));
                              },
                            ),
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
                          return Hero(
                            tag: "FootballNews$index",
                            child: CustomNewsTile(
                              style: index == 0 ? 1 : 3,
                              isVideo: index == 0 ? true : false,
                              onPress: () {
                                Get.to(NewsDetailsScreen(
                                  id: index,
                                  tag: "FootballNews$index",
                                ));
                              },
                            ),
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
                          return Hero(
                            tag: "CricketVideos$index",
                            child: CustomNewsTile(
                              style: 2,
                              isVideo: index == 0 ? true : false,
                              onPress: () {
                                Get.to(NewsDetailsScreen(
                                  id: index,
                                  tag: "CricketVideos$index",
                                ));
                              },
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalButton({String title, IconData icon, Function onPressed}) {
    return RawMaterialButton(
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
      onPressed: onPressed,
    );
  }
}
