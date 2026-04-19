// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:test_ta/Routes/routes.dart';

// class AuthController extends GetxController {
//   var inputUsername = ''.obs;
//   var inputPassword = ''.obs;

//   final String username = "banyu";
//   final String password = "alip";

//   login() async {
//     if (inputUsername.isEmpty || inputPassword.isEmpty) {
//       Get.defaultDialog(
//         title: "Error",
//         middleText: "Username dan Password harus diisi",
//         textConfirm: "OK",
//         onConfirm: () => Get.back(),
//       );
//       return;
//     }

//     if (inputUsername.value == username && inputPassword.value == password) {
//       final prefs = await SharedPreferences.getInstance();
//       prefs.setString("username", inputUsername.value);
//       Get.offAllNamed(AppRoutes.MAIN);
//       print("Login Berhasil");
//     } else {
//       Get.defaultDialog(
//         title: "Login Gagal",
//         middleText: "Username atau password salah",
//         textConfirm: "Ok",
//         onConfirm: () {
//           Get.back();
//         },
//       );
//     }
//   }
// }