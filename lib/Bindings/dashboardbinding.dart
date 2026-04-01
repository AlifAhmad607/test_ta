import 'package:get/get.dart';
import 'package:test_ta/Controllers/dashboardcontroller.dart';

class Dashboardbinding extends Bindings {
  void dependencies(){
    Get.lazyPut<DashboardController>(() => DashboardController());
  } 
}