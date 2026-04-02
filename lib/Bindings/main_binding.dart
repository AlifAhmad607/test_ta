import 'package:get/get.dart';
import 'package:test_ta/Controllers/main_controller.dart';
import 'package:test_ta/Controllers/dashboardcontroller.dart';
import 'package:test_ta/Controllers/analisisController.dart';
import 'package:test_ta/Controllers/ManajemenController.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<AnalisisController>(() => AnalisisController());
    Get.lazyPut<Manajemencontroller>(() => Manajemencontroller());
  }
}
