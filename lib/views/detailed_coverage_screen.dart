import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/controllers/custom_tab_controller.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class DetailedCoverageScreen extends StatelessWidget {
  final String title;

  DetailedCoverageScreen({Key key, this.title}) : super(key: key);
  final CustomTabControllers tabControllers = Get.put(CustomTabControllers());
  final ScrollController _scrollViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              flexibleSpace: boxIsScrolled
                  ? SizedBox()
                  : Center(
                      child: ListTile(
                      leading: Icon(
                        Icons.sports_baseball,
                        size: 60,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            color: Get.theme.accentColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                'Test',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Text(
                            'India in Australia 2020-21',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        '20 November-14January 2021 . 12 Matches',
                        style: TextStyle(color: Get.theme.accentColor),
                      ),
                    )),
              title:
                  !boxIsScrolled ? SizedBox() : Text('Ind vs Aus match live'),
              actions: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                )
              ],
              expandedHeight: 250,
              collapsedHeight: 60,
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              // automaticallyImplyLeading: true,
              // primary: true,
              // centerTitle: true,
              // excludeHeaderSemantics: true,
              // snap: true,
              stretch: true,

              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  decoration: BoxDecoration(
                      color: Get.theme.backgroundColor,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0),
                      )),
                  child: TabBar(
                    controller: tabControllers.detailCoverageTabController,
                    labelColor: Get.theme.primaryColor,
                    unselectedLabelColor: Colors.grey[600],
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Get.theme.primaryColor,
                    physics: BouncingScrollPhysics(),
                    // isScrollable: true,
                    tabs: LanguageService().locale.languageCode == 'bn'
                        ? tabControllers.tabListDetailCoveragebn.map((item) {
                              return Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(item),
                                ),
                              );
                            })?.toList() ??
                            []
                        : tabControllers.tabListDetailCoverage.map((item) {
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
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            _overview(),
            _matches(),
            _newsAndVideos(),
          ],
          controller: tabControllers.detailCoverageTabController,
        ),
      ),
    );
  }

  Widget _overview() {
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
                  onTap: () {},
                ),
                Container(
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
                  onTap: () {},
                ),
                Container(
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

  Widget _matches() {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(20),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Results"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Today"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Upcomming"),
                  ),
                ],
                onPressed: (int index) {
                  /*setState(() {
                    isSelected[index] = !isSelected[index];
                  });*/
                },
                isSelected: [false, true, false]/*isSelected*/,
              ),
            ),
            Scrollbar(
                thickness: 4,
                radius: Radius.circular(4),
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return CustomScoreTile2(
                        onPress: () {},
                      );
                    })),
          ],
        ));
  }

  Widget _newsAndVideos() {
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
                  onTap: () {},
                ),
                Container(
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
                  onTap: () {},
                ),
                Container(
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
