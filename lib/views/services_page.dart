import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:game_buzz/utils/language_services.dart';
import 'package:game_buzz/utils/theme_services.dart';

import 'view_all_widgets.dart';


class ServicesPage extends StatelessWidget{

  final List<String> tabList = [
    "Personalized",
    "Popular",
    "Latest",
    "Romantic Relationship",
  ];

  final List<String> tabListBn = [
    "Personalized",
    "Popular",
    "Latest",
    "Romantic Relationship",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                  leading: Icon(ThemeService().loadThemeFromBox()
                      ? Icons.wb_twighlight
                      : Icons.wb_sunny_sharp),
                  title: Text('change_theme'.tr),
                  subtitle: Text(
                      ThemeService().loadThemeFromBox() ? 'dark'.tr : 'light'.tr),
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
                  subtitle: Text(LanguageService().locale.languageCode == 'bn'
                      ? 'bengali'.tr
                      : 'english'.tr),
                  trailing: Switch(
                    value: LanguageService().locale.languageCode == 'bn'
                        ? true
                        : false,
                    onChanged: (val) {
                      if (val) {
                        LanguageService()
                            .switchLanguage(changeLocale: Locale('bn', 'BD'));
                      } else {
                        LanguageService()
                            .switchLanguage(changeLocale: Locale('en', 'US'));
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
        ],
      ),
    );
  }
}
