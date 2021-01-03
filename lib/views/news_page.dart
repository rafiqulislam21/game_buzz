
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/controllers/custom_tab_controller.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class NewsPage extends StatelessWidget {
  final CustomTabControllers tabControllers = Get.put(CustomTabControllers());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.0,
          padding: EdgeInsets.only(top: 5.0, left: 5, right: 5),
          color: Get.theme.splashColor,
          child: TabBar(
            controller: tabControllers.newsTabController,
            labelColor: Get.theme.primaryColor,
            unselectedLabelColor: Colors.grey[600],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Get.theme.primaryColor,
            physics: BouncingScrollPhysics(),
            // isScrollable: true,
            /*indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Theme.of(context).backgroundColor),*/
            tabs: LanguageService().locale.languageCode == 'bn'
                ? tabControllers.tabListNewsbn.map((item) {
              return Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(item),
                ),
              );
            })?.toList() ??
                []
                : tabControllers.tabListNews.map((item) {
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
            controller: tabControllers.newsTabController,
//              physics: BouncingScrollPhysics(),
            children: [
              _cricket(),
              _cricket(),
              _cricket(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cricket() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //News----------------------------------------------------------
                CustomCategoryTile(
                  title: "Australia vs India News",
                  trailing: "SEE MORE",
                  onTap: (){

                  },
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    children: [
                      CustomNewsTile(
                        style: 1,
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
                      CustomNewsTile(
                        style: 3,
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
                //News----------------------------------------------------------
                CustomCategoryTile(
                  title: "Australia vs India News",
                  trailing: "SEE MORE",
                  onTap: (){

                  },
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    children: [
                      CustomNewsTile(
                        style: 1,
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
                      CustomNewsTile(
                        style: 3,
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
