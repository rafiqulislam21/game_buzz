
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CustomTabControllers extends GetxController with SingleGetTickerProviderMixin{
  TabController videoTabController;
  TabController newsTabController;
  TabController resultsTabController;
  TabController detailCoverageTabController;
  TabController sportTournamentListTabController;
  final List tabListVideo = [
    'Cricket',
    'Football',
    'Basketball',
    'Hockey',
    'NFL',
    'Baseball',
    'Handball',
  ];
  final List tabListVideobn = [
    'ক্রিকেট',
    'ফুটবল',
    'বাস্কেটবল',
    'হকি',
    'এনএফএল',
    'বেসবল',
    'হ্যান্ডবল',
  ];

  final List tabListNews = [
    'Cricket',
    'Football',
    'Hockey',
  ];
  final List tabListNewsbn = [
    'ক্রিকেট',
    'ফুটবল',
    'হকি',
  ];
  final List tabListResults = [
    'Results',
    'Today',
    'Upcoming',
  ];
  final List tabListResultsbn = [
    'ফলাফল',
    'আজ',
    'আসন্ন',
  ];

  final List tabListDetailCoverage = [
    'Overview',
    'Matches',
    'News & Videos',
  ];
  final List tabListDetailCoveragebn = [
    'ওভারভিউ',
    'ম্যাচ',
    'সংবাদ ও ভিডিও',
  ];

  final List tabListTournament = [
    'Pakistan in New zealand 2020-21',
    'Odisha Cricket League',
    'Dream11 Super Smash',
    'Big Bash League, 2020/21',
  ];
  final List tabListTournamentbn = [
    'Pakistan in New zealand 2020-21',
    'Odisha Cricket League',
    'Dream11 Super Smash',
    'Big Bash League, 2020/21',
  ];

  @override
  void onInit() {
    super.onInit();
    updateTab();
  }

  Future updateTab() async {
    Future.delayed(Duration.zero);
    videoTabController = TabController(vsync: this, length: tabListVideo.length);
    newsTabController = TabController(vsync: this, length: tabListNews.length);
    resultsTabController = TabController(vsync: this, length: tabListResults.length);
    detailCoverageTabController = TabController(vsync: this, length: tabListDetailCoverage.length);
    sportTournamentListTabController = TabController(vsync: this, length: tabListTournament.length);
  }
}