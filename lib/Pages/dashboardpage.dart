import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/dashboardcontroller.dart';
import 'package:test_ta/Routes/routes.dart';
import 'package:test_ta/Controllers/main_controller.dart';
import 'package:test_ta/reusablecomponent/infocard.dart';
import 'package:test_ta/reusablecomponent/menuitem.dart';

class Dashboardpage extends GetView<DashboardController> {
  const Dashboardpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      // 🔻 BOTTOM NAV
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔻 HEADER (TANPA OBX ❗)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.greeting,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.todayDate,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.notifications_none),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          Get.find<MainController>().changePage(
                            3,
                          ); // 🔥 Pindah ke Tab Setelan
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.orange.shade200,
                          child: const Icon(Icons.person),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔻 CARD OMZET (PAKAI OBX ✅)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFD97706),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "PENDAPATAN",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Total Omzet Hari Ini",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        controller.formattedOmzet,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "↑ 12% meningkat dari kemarin",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔻 INFO CARD
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => InfoCard(
                        icon: Icons.receipt,
                        title: "Jumlah Transaksi",
                        value: controller.transaksi.value.toString(),
                        subtitle: "order",
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Obx(
                      () => InfoCard(
                        icon: Icons.inventory,
                        title: "Status Stok",
                        value: controller.stokMenipis.value.toString(),
                        subtitle: "Menipis",
                        isWarning: true,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔻 MENU HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Menu Manajemen",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("Lihat Semua", style: TextStyle(color: Colors.orange)),
                ],
              ),

              const SizedBox(height: 16),

              // 🔻 GRID MENU
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  MenuItem(
                    icon: Icons.bar_chart,
                    title: "Laporan",
                    subtitle: "Penjualan & Laba",
                  ),
                  MenuItem(
                    icon: Icons.badge,
                    title: "Absensi Pegawai",
                    subtitle: "8 Staf Hadir",
                  ),
                  MenuItem(
                    icon: Icons.coffee,
                    title: "Stok Harian",
                    subtitle: "Kelola Menu",
                  ),
                  MenuItem(
                    icon: Icons.shopping_cart,
                    title: "Pesanan",
                    subtitle: "Order Masuk",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
