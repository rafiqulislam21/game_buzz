
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:package_info/package_info.dart';

class CustomInfoController extends GetxController{
  var isVisible = false.obs;
  var packageInformation = PackageInfo().obs;

  @override
  void onInit() {
    super.onInit();
    initialization();
  }

  Future initialization() async {
    Future.delayed(Duration.zero);
    await getDeviceInformation();
  }

  getDeviceInformation(){
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      packageInformation.value = packageInfo;
      // String appName = packageInfo.appName;
      // String packageName = packageInfo.packageName;
      // String version = packageInfo.version;
      // String buildNumber = packageInfo.buildNumber;
    });
  }
}