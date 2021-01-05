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
class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  final PageController pageController = PageController();
  final HomePageController controller = Get.put(HomePageController());
  final CustomTabControllers tabControllers = Get.put(CustomTabControllers());
  final CustomInfoController infoController = Get.put(CustomInfoController());

  DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    HapticFeedback.vibrate();
    /*DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar(
        "Exit",
        "Double press to exit from the app!",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        snackbarStatus: (status){

        },
        icon: Icon(Icons.exit_to_app_rounded),
        shouldIconPulse: true,
        snackStyle: SnackStyle.FLOATING,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
      );
      return Future.value(false);
    }
    return Future.value(true);*/

    Get.bottomSheet(
      Container(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            SpinKitThreeBounce(
              color: Colors.red.withOpacity(0.5),
              size: 32,
              /* itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                );
              },*/
            ),
            Text(
              "Do you want to exit?",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: "No",
                    icon: Icons.cancel_outlined,
                    color: Colors.green,
                    textColor: Colors.white),
                CustomButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  text: "Yes",
                  icon: Icons.check_circle_outline,
                  color: Colors.red,
                  textColor: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
      enableDrag: true,
      backgroundColor: Get.theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
    );
    return Future.value(true);
  }

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
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          key: drawerKey,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 4),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Text(
                    "Sports",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                onTap: () {
                  drawerKey.currentState.openDrawer();
                },
              ),
            ),
            /*Container(
                child: IconButton(
                  icon: Icon(Icons.sports_cricket),
                  color: Colors.white,
                  onPressed: () {
                    drawerKey.currentState.openDrawer();
                  },
                ),
              ),*/
            title: Text('title'.tr),
            centerTitle: true,
            elevation: 0,
            actions: [
              Padding(
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
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                    backgroundColor: Get.theme.accentColor,
                    child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        onPressed: () {})),
              ),
            ],
          ),
          drawer: Drawer(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'All Sports',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.sports_cricket,
                              color: Get.theme.primaryColor,
                            ),
                            title: Text(
                              'All Sports',
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.sports_volleyball,
                              color: Get.theme.primaryColor,
                            ),
                            title: Text(
                              'Football',
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.sports_basketball,
                              color: Get.theme.primaryColor,
                            ),
                            title: Text(
                              'Basketball',
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.sports_hockey,
                              color: Get.theme.primaryColor,
                            ),
                            title: Text(
                              'Hockey',
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.sports_football,
                              color: Get.theme.primaryColor,
                            ),
                            title: Text(
                              'NFL',
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.sports_baseball,
                              color: Get.theme.primaryColor,
                            ),
                            title: Text(
                              'Baseball',
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            dense: true,
                            leading: Icon(
                              Icons.sports_handball,
                              color: Get.theme.primaryColor,
                            ),
                            title: Text(
                              'Handball',
                            ),
                            onTap: () {},
                          ),
                          Divider(),
                          ListTile(
                              leading: Icon(ThemeService().loadThemeFromBox()
                                  ? Icons.wb_twighlight
                                  : Icons.wb_sunny_sharp),
                              title: Text('change_theme'.tr),
                              subtitle: Text(ThemeService().loadThemeFromBox()
                                  ? 'dark'.tr
                                  : 'light'.tr),
                              trailing: Switch(
                                value: ThemeService().loadThemeFromBox(),
                                onChanged: (val) {
                                  ThemeService().switchTheme();
                                },
                                activeColor: Theme.of(context).accentColor,
                              )),
                          ListTile(
                              leading: Icon(Icons.translate),
                              title: Text('change_language'.tr),
                              subtitle: Text(
                                  LanguageService().locale.languageCode == 'bn'
                                      ? 'bengali'.tr
                                      : 'english'.tr),
                              trailing: Switch(
                                value: LanguageService().locale.languageCode == 'bn'
                                    ? true
                                    : false,
                                onChanged: (val) {
                                  if (val) {
                                    LanguageService().switchLanguage(
                                        changeLocale: Locale('bn', 'BD'));
                                  } else {
                                    LanguageService().switchLanguage(
                                        changeLocale: Locale('en', 'US'));
                                  }
                                },
                                activeColor: Theme.of(context).accentColor,
                              )),
                          ListTile(
                            leading: Icon(Icons.widgets),
                            title: Text('Essential widgets'),
                            subtitle: Text('Custom widgets for use'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Get.to(
                                ViewAllWidgets(),
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOutBack,
                                transition: Transition.zoom,
                              );
                            },
                          ),
                        ],
                      )
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8.0),
                    child: Obx(() => Text(
                      "version".tr+"-${NumberTranslator.translate(number: infoController?.packageInformation?.value?.version??'-')}",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Get.theme.accentColor,
                      ),
                      textAlign: TextAlign.right,
                    )),
                  ),
                ],
              ),
            ),
          ),
          body: PageView(
            controller: pageController,
            /*onPageChanged: (pageNo){
                controller.updatePage(pageNo);
              },*/
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomePage(),
              SchedulePage(),
              NewsPage(),
              VideosPage(),
              ShopPage(),
            ],
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
                elevation: 20,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Get.theme.backgroundColor,
                // mouseCursor: MouseCursor.defer,
                selectedItemColor: Get.theme.primaryColor,
                currentIndex: controller.pageNo.toInt(),
                onTap: (value) {
                  controller.updatePage(value);
                  pageController.animateToPage(controller.pageNo.value,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutQuart);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.date_range), label: 'Schedule'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt_rounded), label: 'News'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.ondemand_video), label: 'Videos'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag_outlined), label: 'Shop'),
                ]),
          )),
    );
  }

/*
  _showSnackBar() {
    Get.snackbar(
      "Hey There",
      "Snackbar is easy",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 5),
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: "Simple Dialog",
      content: Text("Too Easy"),
      // cancel: Text("Cancel"),
      onCancel: () {
        print("taouched");
        Get.back();
      },
      radius: 10,
    );
  }

  _showBottomSheet() {
    Get.bottomSheet(
      Container(
        // color: Get.theme.cardColor,
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {}),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {},
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      enableDrag: true,
      backgroundColor: Get.theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
    );
  }*/
}
