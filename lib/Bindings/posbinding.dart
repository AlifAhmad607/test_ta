import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:test_ta/Controllers/POScontroller.dart';

class Posbinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
     Get.lazyPut<PosController>(() => PosController());
  }
}