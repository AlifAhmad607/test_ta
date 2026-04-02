import 'package:get/get.dart';
import 'package:test_ta/Controllers/ManajemenController.dart';


class Manajemenbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Manajemencontroller>(() => Manajemencontroller());
  }
}