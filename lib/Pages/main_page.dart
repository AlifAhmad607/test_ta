import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/main_controller.dart';
import 'package:test_ta/Pages/dashboardpage.dart';
import 'package:test_ta/Pages/analisisPage.dart';
import 'package:test_ta/Pages/manajemenHPP.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            Dashboardpage(),
            AnalisisPage(),
            ManajemenPage(),
            Center(child: Text("Halaman Setelan (Belum dibuat)")),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          type: BottomNavigationBarType
              .fixed, // Penting agar icon tidak bergerak kalau item > 3
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Analisis",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: "HPP & Margin",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setelan",
            ),
          ],
        ),
      ),
    );
  }
}
