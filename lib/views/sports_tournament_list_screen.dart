
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_buzz/controllers/custom_tab_controller.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

class SportsTournamentListScreen extends StatelessWidget {
  final String title;

  SportsTournamentListScreen({Key key, this.title}) : super(key: key);

  final CustomTabControllers tabControllers = Get.put(CustomTabControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title??"Matches"),
        elevation: 0,
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
      ),
      floatingActionButton: Align(
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
      ),
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
