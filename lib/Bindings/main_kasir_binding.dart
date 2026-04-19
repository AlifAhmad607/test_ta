import 'package:get/get.dart';
import 'package:test_ta/Controllers/POScontroller.dart';
import 'package:test_ta/Controllers/dashboardKasirController.dart';
import 'package:test_ta/Controllers/main_kasir_controller.dart';

class MainKasirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainKasirController>(() => MainKasirController());
    Get.lazyPut<DashboardKasirController>(() => DashboardKasirController());
    Get.lazyPut<PosController>(() => PosController());
  }
}
