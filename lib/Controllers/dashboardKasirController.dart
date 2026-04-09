import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_ta/model/DashboardKasirModel.dart';

class DashboardKasirController extends GetxController {
  // --- STATE VARIABLES ---
  var shopName = 'COFFEE STREET UMKM'.obs;
  var shiftStatus = 'AKTIF'.obs;
  var workDuration = '04:25:12'.obs;
  var todayTotal = 'Rp 1.250k'.obs;

  // --- DUMMY DATA ---
  var availableStocks = <StockModel>[].obs;
  var recentTransactions = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Simulasi ambil data saat page di-load
  }

  // --- LOGIC FUNCTIONS ---
  void fetchData() {
    availableStocks.value = [
      StockModel(
        name: 'Biji Kopi',
        amount: 12.5,
        unit: 'kg',
        status: 'AMAN',
        icon: Icons.coffee_maker,
      ),
      StockModel(
        name: 'Susu UHT',
        amount: 4.2,
        unit: 'L',
        status: 'RENDAH',
        icon: Icons.water_drop,
      ),
    ];

    recentTransactions.value = [
      TransactionModel(
        title: '2x Caramel Macchiato',
        time: '14:20',
        paymentMethod: 'Tunai',
        price: 'Rp 48.000',
        icon: Icons.local_cafe,
      ),
      TransactionModel(
        title: '1x Brown Sugar Latte',
        time: '14:05',
        paymentMethod: 'QRIS',
        price: 'Rp 22.000',
        icon: Icons.icecream,
      ),
      TransactionModel(
        title: '1x Americano Ice',
        time: '13:58',
        paymentMethod: 'Tunai',
        price: 'Rp 15.000',
        icon: Icons.local_cafe,
      ),
    ];
  }

  void onNewTransactionClicked() {
    // Logic untuk pindah ke halaman transaksi
    Get.snackbar('Navigasi', 'Masuk ke halaman Transaksi Penjualan');
  }

  void onSeeAllStockClicked() {
    // Logic lihat semua stok
  }

  void onInputStokClicked() {
    // Logic untuk menginput stok harian
  }

  void onRiwayatTransaksiClicked() {
    // Logic untuk melihat riwayat transaksi
  }
}
