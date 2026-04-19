import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/main_controller.dart';
import 'package:test_ta/Pages/dashboardpage.dart';
import 'package:test_ta/Pages/analisisPage.dart';
import 'package:test_ta/Pages/manajemenHPP.dart';
import 'package:test_ta/Pages/settingpage.dart';

class MainPage extends GetView<MainController> {
   MainPage({super.key});

  final List<Widget> _pages = [
    const Dashboardpage(),
    const AnalisisPage(),
    const ManajemenPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
  () => Scaffold(
    body: IndexedStack(
          index: controller.currentIndex.value,
          children: _pages,
        ),
          bottomNavigationBar: BottomNavigationBar(
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
