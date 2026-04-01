import 'package:get/get.dart';
import 'package:test_ta/Controllers/analisisController.dart';

class AnalisisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalisisController>(() => AnalisisController());
  }
}
