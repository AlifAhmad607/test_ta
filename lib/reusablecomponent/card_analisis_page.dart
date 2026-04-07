import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/analisisController.dart';
import 'package:test_ta/reusablecomponent/app_colors.dart';

class CardChartAnalisis extends StatelessWidget {
  const CardChartAnalisis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class CardTopProduk extends GetView<AnalisisController> {
  const CardTopProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}

class CardMetrikProduk extends StatelessWidget {
  const CardMetrikProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text("Lihat Semua", style: TextStyle(color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 12),
          _tableRow("Produk", "Terjual", "Pendapatan", "Laba", isHeader: true),
          _tableRow("Kopi Susu Aren", "142", "2.8M", "1.8M"),
          _tableRow("Cafe Latte", "98", "2.4M", "1.2M"),
          _tableRow("Matcha Latte", "54", "1.3M", "0.7M"),
        ],
      ),
    );
  }

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
