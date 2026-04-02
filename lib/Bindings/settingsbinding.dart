import 'package:get/get.dart';
import 'package:test_ta/Controllers/settingcontroller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}