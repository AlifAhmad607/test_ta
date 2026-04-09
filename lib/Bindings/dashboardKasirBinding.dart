import 'package:get/get.dart';
import 'package:test_ta/Controllers/dashboardKasirController.dart';


class DashboardKasirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardKasirController>(() => DashboardKasirController());
  }
}