import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/controllers/custom_tab_controller.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class SportsTournamentListScreen extends StatelessWidget {
  final CustomTabControllers tabControllers = Get.put(CustomTabControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matches"),
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
                  color: Colors.deepOrange[300]),
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
                  : tabControllers.tabListTournament.map((item) {
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
                _matches(),
                _matches(),
                _matches(),
                _matches(),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _matches() {
    return Scrollbar(
      thickness: 4,
      radius: Radius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0),
            // shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (_, index) {
              return CustomScoreTile2(
                onPress: () {},
              );
            }),
      ),
    );
  }
}
