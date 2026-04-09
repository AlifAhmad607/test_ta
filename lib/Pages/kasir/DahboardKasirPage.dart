import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/dashboardKasirController.dart';
import 'package:test_ta/reusablecomponent/dashboardKasirWidget.dart';

class DashboardKasirPage extends GetView<DashboardKasirController> {
  const DashboardKasirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F9FA,
      ), // Warna background abu-abu sangat terang
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- HEADER ---
                  Obx(
                    () => DashboardHeader(shopName: controller.shopName.value),
                  ),
                  const SizedBox(height: 24),

                  // --- SHIFT STATUS ---
                  Obx(
                    () => ShiftStatusCard(
                      shiftStatus: controller.shiftStatus.value,
                      workDuration: controller.workDuration.value,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- MAIN ACTION BUTTON ---
                  MainActionCard(onTap: controller.onNewTransactionClicked),
                  const SizedBox(height: 24),

                  // --- STOK TERSEDIA ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Stok Tersedia',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.textDark,
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.onSeeAllStockClicked,
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                            color: AppColors.primaryOrange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.availableStocks
                          .map(
                            (stock) => StockCard(
                              title: stock.name,
                              value: stock.amount.toString(),
                              unit: stock.unit,
                              status: stock.status,
                              icon: stock.icon,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- QUICK ACTIONS ---
                  Row(
                    children: [
                      Expanded(
                        child: QuickActionCard(
                          icon: Icons.inventory_2,
                          title: 'Input Stok Harian',
                          onTap: controller.onInputStokClicked,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: QuickActionCard(
                          icon: Icons.history,
                          title: 'Riwayat Transaksi',
                          onTap: controller.onRiwayatTransaksiClicked,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // --- TRANSAKSI TERAKHIR ---
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaksi Terakhir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.textDark,
                        ),
                      ),
                      Text(
                        'Hari Ini',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => Column(
                      children: controller.recentTransactions
                          .map(
                            (tx) => TransactionTile(
                              title: tx.title,
                              subtitle: '${tx.time} • ${tx.paymentMethod}',
                              price: tx.price,
                              icon: tx.icon,
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  const SizedBox(
                    height: 80,
                  ), // Spacer untuk Total Floating Button
                ],
              ),
            ),

            // --- FLOATING TOTAL WIDGET ---
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Obx(
                () => FloatingTotalBar(total: controller.todayTotal.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
