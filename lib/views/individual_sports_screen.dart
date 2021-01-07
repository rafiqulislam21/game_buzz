import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_buzz/controllers/custom_info_controller.dart';
import 'package:game_buzz/controllers/custom_tab_controller.dart';
import 'package:game_buzz/controllers/home_page_controller.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'package:game_buzz/utils/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/views/home_page.dart';
import 'package:game_buzz/views/schedule_page.dart';
import 'package:game_buzz/views/shop_page.dart';
import 'package:game_buzz/views/videos_page.dart';
import 'package:game_buzz/views/widgets/custom_button.dart';
import 'package:game_buzz/views/widgets/widgets.dart';
import 'package:get/get.dart';

import 'news_page.dart';
import 'search_screen.dart';
import 'view_all_widgets.dart';

// ignore: must_be_immutable
class IndividualSportsScreen extends StatelessWidget {
  final String title;

  IndividualSportsScreen({Key key, this.title}) : super(key: key);

  final CustomTabControllers tabControllers = Get.put(CustomTabControllers());

  @override
  Widget build(BuildContext context) {
    /*pageController.addListener(() {
      controller.updatePage(pageController.page);
    });*/
    List<ListWords> listWords = [
      ListWords('oneWord', 'OneWord definition'),
      ListWords('twoWord', 'TwoWord definition.'),
      ListWords('TreeWord', 'TreeWord definition'),
    ];
    return Scaffold(
          appBar: AppBar(
            title: Text(title??'title'.tr),
            // centerTitle: true,
            elevation: 0,
            actions: [
             /* Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Get.to(SearchScreen());
                      showSearch(
                          context: context, delegate: DataSearch(listWords));
                    }),
              ),*/
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.sports_cricket_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                height: 40.0,
                padding: EdgeInsets.only(top: 5.0, left: 5, right: 5),
                color: Get.theme.appBarTheme.color,
                child: TabBar(
                  controller: tabControllers.sportTournamentListTabController,
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
                      ? tabControllers.tabListTournamentbn.map((item) {
                    return Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(item),
                      ),
                    );
                  })?.toList() ??
                      []
                      : tabControllers.tabListTournamentbn.map((item) {
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
                  controller: tabControllers.sportTournamentListTabController,
//              physics: BouncingScrollPhysics(),
                  children: [
                    HomePage(),
                    HomePage(),
                    HomePage(),
                    HomePage(),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
