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
    return Column(
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
