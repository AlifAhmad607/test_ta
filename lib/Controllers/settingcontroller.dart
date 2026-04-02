import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isTunai = true.obs;
  var isQris = true.obs;
  var isBank = false.obs;

  final merchantId = ''.obs;
  final apiKey = ''.obs;

  void toggleTunai(bool val) => isTunai.value = val;
  void toggleQris(bool val) => isQris.value = val;
  void toggleBank(bool val) => isBank.value = val;

  void save() {
    Get.snackbar("Sukses", "Pengaturan disimpan");
  }
}