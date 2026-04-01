import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/logincontroller.dart';

class LoginBinding extends Bindings {
 void dependencies() {
   Get.lazyPut<LoginController>(() => LoginController());
 } 
}