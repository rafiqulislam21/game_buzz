import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'title': 'Game Buzz',
      'change_theme': "Change Theme",
      'light': "Light",
      'dark': "Dark",
      'change_language': "Change Language",
      'english': "English",
      'version': "Version",
    },
    'bn_BD': {
      'title': 'গেইম বাজ',
      'change_theme': "থিম পরিবর্তন করুন",
      'light': "লাইট",
      'dark': "ডার্ক",
      'change_language': "ভাষা পরিবর্তন করুন",
      'english': "ইংরেজী",
      'bengali': "বাংলা",
      'version': "ভার্সন",
    }
  };
}