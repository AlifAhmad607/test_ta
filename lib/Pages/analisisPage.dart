import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/analisisController.dart';
import 'package:test_ta/reusablecomponent/app_colors.dart';
import 'package:test_ta/reusablecomponent/infocard.dart';
import 'package:test_ta/Routes/routes.dart';

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
                // aksi ketika diklik (misal ke profile page)
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
              Container(
                height: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Center(
                  child: Text(
                    "Chart Placeholder",
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ================= TOP PRODUK =================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Top 5 Produk Terlaris",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Obx(
                      () => Column(
                        children: controller.products.map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item["name"].toString(),
                                      style: const TextStyle(
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    Text(
                                      "${item["value"]} Cup",
                                      style: const TextStyle(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 6),

                                LinearProgressIndicator(
                                  value: (item["value"] as int) / 150,
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: AppColors.progressTrack,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ================= TABLE =================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Metrik Performa Produk",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          "Lihat Semua",
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    _tableRow(
                      "Produk",
                      "Terjual",
                      "Pendapatan",
                      "Laba",
                      isHeader: true,
                    ),

                    _tableRow("Kopi Susu Aren", "142", "2.8M", "1.8M"),
                    _tableRow("Cafe Latte", "98", "2.4M", "1.2M"),
                    _tableRow("Matcha Latte", "54", "1.3M", "0.7M"),
                  ],
                ),
              ),
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

  // ================= TABLE =================
  Widget _tableRow(
    String a,
    String b,
    String c,
    String d, {
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              a,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              b,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            child: Text(
              c,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            child: Text(d, style: const TextStyle(color: AppColors.labaGreen)),
          ),
        ],
      ),
    );
  }
}
