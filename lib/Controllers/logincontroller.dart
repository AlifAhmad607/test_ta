import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Routes/routes.dart';

class LoginController extends GetxController {
  // 🔐 state
  var isHidden = true.obs;
  var isLoading = false.obs;

  // 📝 controller input
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // 👁️ toggle password
  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  // 🔑 LOGIN FUNCTION (dummy)
  void login() {
    Get.offAllNamed(AppRoutes.MAIN);
  }

  // 🧹 bersihin controller
  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
