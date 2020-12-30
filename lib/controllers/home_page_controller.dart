
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePageController extends GetxController {
  var pageNo = 0.obs;

  @override
  void onInit() {
    super.onInit();
    updatePage(0);
  }

  Future updatePage(var page) async {
    Future.delayed(Duration.zero);
    pageNo.value = page.toInt();
  }
}