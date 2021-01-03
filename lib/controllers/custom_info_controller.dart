
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CustomInfoControllers extends GetxController{
  var isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    updateTab();
  }

  Future updateTab() async {
    Future.delayed(Duration.zero);

  }
}