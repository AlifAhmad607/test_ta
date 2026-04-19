import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/ManajemenController.dart';
import 'package:test_ta/Controllers/main_controller.dart';
import 'package:test_ta/reusablecomponent/card_manajemen_page.dart';

class ManajemenPage extends GetView<Manajemencontroller> {
  const ManajemenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildEstimasiRow(),
                    const SizedBox(height: 20),
                    _buildDaftarMarginHeader(),
                    const SizedBox(height: 8),
                    _buildTableHeader(),
                    const SizedBox(height: 4),
                    _buildProductList(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // ─── AppBar ───────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          const Text(
            'Manajemen HPP',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: controller.onNotificationTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.notifications_outlined,
                size: 20,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Get.find<MainController>().changePage(
                3,
              ); // 🔥 Pindah ke Tab Setelan
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFE8A87C),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Estimasi Row ─────────────────────────────────────────────────────────
  Widget _buildEstimasiRow() {
    return Row(
      children: const [
        Expanded(child: CardLabaHarian()),
        SizedBox(width: 12),
        Expanded(child: CardLabaBulanan()),
      ],
    );
  }

  // ─── Daftar Margin Header ─────────────────────────────────────────────────
  Widget _buildDaftarMarginHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.bar_chart_rounded,
            color: Color(0xFFFF9800),
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Daftar Margin per Produk',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: controller.onLihatLaporanTap,
          child: const Text(
            'Lihat Laporan  ›',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF9800),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Table Header ─────────────────────────────────────────────────────────
  Widget _buildTableHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              'NAMA & HARGA',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9E9E9E),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'HPP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9E9E9E),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'MARGIN',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9E9E9E),
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Product List ─────────────────────────────────────────────────────────
  Widget _buildProductList() {
    return Obx(
      () => Column(
        children: controller.products
            .map((product) => CardProductItem(product: product))
            .toList(),
      ),
    );
  }
}
