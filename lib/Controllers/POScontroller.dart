  import 'package:get/get.dart';

  class PosController extends GetxController {
    var selectedCategory = "Semua".obs;

    final categories = [
      "Semua",
      "Espresso Base",
      "Manual Brew",
      "Non Coffee",
    ];

    void changeCategory(String category) {
      selectedCategory.value = category;
    }
  } 