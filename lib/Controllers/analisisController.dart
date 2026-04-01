import 'package:get/get.dart';

class AnalisisController extends GetxController {
  // Filter
  var selectedFilter = '7 Hari Terakhir'.obs;

  // Dummy data (nanti ganti dari API/database)
  var totalPenjualan = "Rp 12.450k".obs;
  var totalHpp = "Rp 4.210k".obs;
  var labaKotor = "Rp 8.240k".obs;
  var margin = "66.2%".obs;

  var products = [
    {"name": "Es Kopi Susu Aren", "value": 142},
    {"name": "Cafe Latte", "value": 98},
    {"name": "Americano Ice", "value": 76},
    {"name": "Caramel Macchiato", "value": 45},
  ].obs;

  void changeFilter(String value) {
    selectedFilter.value = value;
  }
}
