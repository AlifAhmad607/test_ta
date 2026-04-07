import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/analisisController.dart';
import 'package:test_ta/reusablecomponent/app_colors.dart';
import 'package:test_ta/reusablecomponent/infocard.dart';
import 'package:test_ta/Routes/routes.dart';
import 'package:test_ta/Controllers/main_controller.dart';
import 'package:test_ta/reusablecomponent/card_analisis_page.dart';

class AnalisisPage extends GetView<AnalisisController> {
  const AnalisisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Analisis"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Get.find<MainController>().changePage(
                  3,
                ); // 🔥 Pindah ke Tab Setelan
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryLight,
                child: const Icon(Icons.person, color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ================= 🔥 FILTER (SESUAI GAMBAR) =================
              Row(
                children: [
                  _filterChip("7 Hari Terakhir", Icons.calendar_today),
                  const SizedBox(width: 7),
                  _filterChip("Semua Produk", Icons.local_cafe),
                ],
              ),

              const SizedBox(height: 16),
              // ================= HEADER =================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0, // 🔥 fix overflow
                  children: [
                    InfoCard(
                      icon: Icons.attach_money,
                      title: "Total Penjualan",
                      value: controller.totalPenjualan.value,
                      subtitle: "7 Hari Terakhir",
                    ),
                    InfoCard(
                      icon: Icons.shopping_cart,
                      title: "Total HPP",
                      value: controller.totalHpp.value,
                      subtitle: "Pengeluaran",
                      isWarning: true,
                    ),
                    InfoCard(
                      icon: Icons.trending_up,
                      title: "Laba Kotor",
                      value: controller.labaKotor.value,
                      subtitle: "Profit",
                    ),
                    InfoCard(
                      icon: Icons.percent,
                      title: "Margin",
                      value: controller.margin.value,
                      subtitle: "Rata-rata",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ================= CHART =================
              const CardChartAnalisis(),

              const SizedBox(height: 16),

              // ================= TOP PRODUK =================
              const CardTopProduk(),

              const SizedBox(height: 16),

              // ================= TABLE =================
              const CardMetrikProduk(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.download, color: Colors.white),
      ),
    );
  }

  // ================= FILTER =================
  Widget _filterChip(String title, IconData icon) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.changeFilter(title),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: controller.selectedFilter.value == title
                ? AppColors.primary
                : AppColors.primaryLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: controller.selectedFilter.value == title
                    ? Colors.white
                    : AppColors.primary,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  color: controller.selectedFilter.value == title
                      ? Colors.white
                      : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
