import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/controllers/custom_tab_controller.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'sports_tournament_list_screen.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class SchedulePage extends StatelessWidget {
  final CustomTabControllers tabControllers = Get.put(CustomTabControllers());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 40.0,
              padding: EdgeInsets.only(top: 5.0, left: 5, right: 5),
              color: Get.theme.appBarTheme.color,
              child: TabBar(
                controller: tabControllers.videoTabController,
                labelColor: Colors.white,
                unselectedLabelColor: Get.theme.accentColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                physics: BouncingScrollPhysics(),
                isScrollable: true,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Get.theme.accentColor.withOpacity(0.4)),
                tabs: LanguageService().locale.languageCode == 'bn'
                    ? tabControllers.tabListVideobn.map((item) {
                          return Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(item),
                            ),
                          );
                        })?.toList() ??
                        []
                    : tabControllers.tabListVideo.map((item) {
                          return Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(item),
                            ),
                          );
                        })?.toList() ??
                        [],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: tabControllers.videoTabController,
//              physics: BouncingScrollPhysics(),
                children: [
                  _innerTabView(),
                  _innerTabView(),
                  _innerTabView(),
                  _innerTabView(),
                  _innerTabView(),
                  _innerTabView(),
                  _innerTabView(),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FloatingActionButton.extended(
              icon: Icon(Icons.filter_list,
                  color: Get.theme.textTheme.bodyText1.color),
              label: Text(
                "Filter",
                style: TextStyle(color: Get.theme.textTheme.bodyText1.color),
              ),
              backgroundColor: Get.theme.cardColor,
              onPressed: () {
                Get.bottomSheet(
                  Container(
                      // color: Get.theme.cardColor,
                      height: Get.size.height * 0.85,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.filter_list),
                            SizedBox(width: 10,),
                            Text("Filter Matches"),
                            Spacer(),
                            FlatButton(
                                child: Text("Clear"),
                              onPressed: (){

                              },
                            ),
                            IconButton(
                                icon: Transform.rotate(
                                    angle: 70, child: Icon(Icons.add)),
                                onPressed: () {
                                  Get.back();
                                })
                          ],
                        ),
                      ),
                      Container(
                        color: Get.theme.accentColor,
                        height: 0.3,
                        width: double.infinity,
                      ),
                      SwitchListTile(
                        title: Text("Live Streaming Matches"),
                          activeColor: Get.theme.primaryColor,
                          dense: true,
                          value: true,
                          onChanged: (val){

                          },
                      ),
                      Container(
                        color: Get.theme.accentColor,
                        height: 0.3,
                        width: double.infinity,
                      ),
                      ListTile(
                        title: Text("Tournaments"),
                        subtitle: Text("Select tournaments to see their matches"),
                        dense: true,
                      ),
                      Container(
                        color: Get.theme.accentColor,
                        height: 0.3,
                        width: double.infinity,
                      ),
                      Expanded(
                        child: Scrollbar(
                          thickness: 2,
                          radius: Radius.circular(5),
                          child: GridView.builder(
                              // shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                              itemCount: 10,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (_,index){
                                return CustomFilterChip(
                                  style: 2,
                                  isSelected: false,
                                  onSelect: (val) {

                                  },
                                  chipName: "T20 India Nippon Cup, 2021",
                                );
                              }
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                text: "Apply Filters",
                                color: Get.theme.primaryColor,
                                textColor: Colors.white,
                                onPressed: (){
                                  Get.back();
                                }
                            ),
                          )
                        ],
                      )
                    ],
                  )),
                  isScrollControlled: true,
                  enableDrag: true,
                  backgroundColor: Get.theme.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                  ),
                  clipBehavior: Clip.antiAlias,
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _innerTabView() {
    return Column(
      children: [
        Container(
          height: 40.0,
          padding: EdgeInsets.only(top: 5.0, left: 5, right: 5),
          color: Get.theme.cardColor,
          child: TabBar(
            controller: tabControllers.resultsTabController,
            labelColor: Get.theme.primaryColor,
            unselectedLabelColor: Get.theme.accentColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Get.theme.primaryColor,
            physics: BouncingScrollPhysics(),
            // isScrollable: true,
            /*indicator: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.deepOrange[300]),*/
            tabs: LanguageService().locale.languageCode == 'bn'
                ? tabControllers.tabListResultsbn.map((item) {
                      return Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(item),
                        ),
                      );
                    })?.toList() ??
                    []
                : tabControllers.tabListResults.map((item) {
                      return Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(item),
                        ),
                      );
                    })?.toList() ??
                    [],
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            controller: tabControllers.resultsTabController,
//              physics: BouncingScrollPhysics(),
            children: [
              _matches(),
              _matches(),
              _matches(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _matches() {
    return Scrollbar(
      thickness: 4,
      radius: Radius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCategoryTile(
                  title: "Pakistan in New Zealand, 2020-21",
                  trailingIcon: Icons.arrow_right_alt,
                  onTap: () {
                    Get.to(SportsTournamentListScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 400));
                  },
                ),
                CustomScoreTile2(
                  onPress: () {
                    Get.to(SportsTournamentListScreen());
                  },
                ),
                CustomCategoryTile(
                  title: "Odisha Cricket Leauge, 2020-21",
                  trailingIcon: Icons.arrow_right_alt,
                  onTap: () {
                    Get.to(SportsTournamentListScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 400));
                  },
                ),
                ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return CustomScoreTile2(
                        onPress: () {},
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
