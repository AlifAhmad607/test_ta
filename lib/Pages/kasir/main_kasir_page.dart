import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/main_kasir_controller.dart';
import 'package:test_ta/Pages/kasir/DahboardKasirPage.dart';
import 'package:test_ta/reusablecomponent/dashboardKasirWidget.dart'; // Untuk mendapatkan AppColors

class MainKasirPage extends GetView<MainKasirController> {
  const MainKasirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            DashboardKasirPage(), // 0: Halaman Dashboard Kasir
            Center(child: Text("Halaman POS")), // 1: Placeholder POS
            Center(child: Text("Halaman Riwayat")), // 2: Placeholder Riwayat
            Center(child: Text("Halaman Profil")), // 3: Placeholder Profil
          ],
        ),
      ),
      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryOrange,
          unselectedItemColor: AppColors.textLight,
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
