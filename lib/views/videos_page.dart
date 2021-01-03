
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/controllers/custom_tab_controller.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class VideosPage extends StatelessWidget {
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
            controller: tabControllers.videoTabController,
            labelColor: Get.theme.primaryColor,
            unselectedLabelColor: Colors.grey[600],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Get.theme.primaryColor,
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            /*indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Theme.of(context).backgroundColor),*/
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
            controller: tabControllers.videoTabController,
//              physics: BouncingScrollPhysics(),
            children: [
              _cricket(),
              _cricket(),
              _cricket(),
              _cricket(),
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
                  //PSL------------------------------------------------------
                  CustomCategoryTile(
                    title: "PSL",
                    trailing: "SEE MORE",
                    onTap: (){

                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    height: Get.size.height * 0.28,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      children: [
                        CustomNewsTile(
                          style: 2,
                          onPress: () {},
                        ),
                        CustomNewsTile(
                          style: 2,
                        ),
                        CustomNewsTile(
                          style: 2,
                        ),
                        CustomNewsTile(
                          style: 2,
                        ),
                      ],
                    ),
                  ),
                  //PSL------------------------------------------------------
                  CustomCategoryTile(
                    title: "Featured Videos",
                    trailing: "SEE MORE",
                    onTap: (){

                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    height: Get.size.height * 0.28,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      children: [
                        CustomNewsTile(
                          style: 2,
                          onPress: () {},
                        ),
                        CustomNewsTile(
                          style: 2,
                        ),
                        CustomNewsTile(
                          style: 2,
                        ),
                        CustomNewsTile(
                          style: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
