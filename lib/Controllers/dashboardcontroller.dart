import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  var omzet = 2450000.obs;
  var transaksi = 42.obs;
  var stokMenipis = 5.obs;

  String get formattedOmzet {
  return "Rp ${omzet.value}";
}

  String get todayDate {
    return "Sabtu, 24 Mei 2024"; // nanti bisa dynamic
  }

  String get greeting => "Halo, Owner!";
}