import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:test_ta/Controllers/POScontroller.dart';
import 'package:test_ta/Controllers/main_kasir_controller.dart';
import 'package:test_ta/Pages/kasir/DahboardKasirPage.dart';
import 'package:test_ta/Pages/kasir/POS.dart';
import 'package:test_ta/reusablecomponent/app_colors.dart';

class MainKasirPage extends StatelessWidget {
  MainKasirPage({Key? key}) : super(key: key);

  final controller = Get.find<MainKasirController>();
  final posController = Get.find<PosController>(); // 🔥 FIX DI SINI
  final List<Widget> pages = [
    DashboardKasirPage(),
    PosPage(),
    Center(child: Text("Riwayat")),
    Center(child: Text("Profil")),
  ];
  @override
  Widget build(BuildContext context) {
   return Obx(
  () => Scaffold(
    body: IndexedStack( // sekalian upgrade biar ga reset
      index: controller.currentIndex.value,
      children: pages,
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.primaryLight,
      currentIndex: controller.currentIndex.value,
      onTap: controller.changePage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.point_of_sale),
          label: 'POS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
    ),
  ),
);
  }
}