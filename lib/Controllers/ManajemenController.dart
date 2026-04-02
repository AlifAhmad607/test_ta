import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Manajemencontroller extends GetxController {
  // ─── State ────────────────────────────────────────────────────────────────
  final RxDouble estaLabaHarian = 1250000.0.obs;
  final RxDouble estaLabaBulanan = 34800000.0.obs;
  final RxDouble targetLabaBulanan = 40000000.0.obs;
  final RxDouble persenDariKemarin = 12.0.obs;

  final RxList<ProductMargin> products = <ProductMargin>[
    ProductMargin(nama: 'Es Kopi Aren', hargaJual: 18000, hpp: 5700),
    ProductMargin(nama: 'Caramel Macchiato', hargaJual: 25000, hpp: 14200),
    ProductMargin(nama: 'Mocha Almond', hargaJual: 22000, hpp: 23500),
    ProductMargin(nama: 'Americano', hargaJual: 15000, hpp: 8000),
    ProductMargin(nama: 'Vietnam Drip', hargaJual: 16000, hpp: 9200),
  ].obs;

  // ─── Computed: Laba Harian ────────────────────────────────────────────────
  bool get isLabaHarianNaik => persenDariKemarin.value >= 0;

  String get labaHarianFormatted => _formatRupiah(estaLabaHarian.value);

  String get labaBulananFormatted => 'Rp ${_formatAngka(estaLabaBulanan.value)}';

  String get targetLabaFormatted =>
      'Target: Rp ${_formatAngkaShort(targetLabaBulanan.value)}';

  String get persenKemarinFormatted =>
      '${persenDariKemarin.value.toStringAsFixed(0)}% dari kemarin';

  IconData get trendIconData =>
      isLabaHarianNaik ? Icons.trending_up : Icons.trending_down;

  IconData get arrowIconData =>
      isLabaHarianNaik ? Icons.arrow_upward : Icons.arrow_downward;

  Color get trendColor =>
      isLabaHarianNaik ? const Color(0xFF4CAF50) : const Color(0xFFF44336);

  // ─── Computed: Per-product (dipanggil dari page) ───────────────────────────
  Color productNameColor(ProductMargin product) =>
      product.isRugi ? const Color(0xFFEF5350) : const Color(0xFF1A1A2E);

  Color marginColor(ProductMargin product) =>
      product.isRugi ? const Color(0xFFEF5350) : const Color(0xFF4CAF50);

  Color marginNominalColor(ProductMargin product) =>
      product.isRugi ? const Color(0xFFEF5350) : const Color(0xFF9E9E9E);

  Color cardColor(ProductMargin product) =>
      product.isRugi ? const Color(0xFFFFF0F0) : Colors.white;

  Border? cardBorder(ProductMargin product) => product.isRugi
      ? const Border(left: BorderSide(color: Color(0xFFEF5350), width: 3))
      : null;

  List<BoxShadow>? cardShadow(ProductMargin product) => product.isRugi
      ? null
      : [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ];

  // ─── Navigation ───────────────────────────────────────────────────────────
  void onLihatLaporanTap() {
    // Get.toNamed(Routes.LAPORAN_HPP);
  }

  void onNotificationTap() {
    // Get.toNamed(Routes.NOTIFICATION);
  }

  void onProfileTap() {
    // Get.toNamed(Routes.PROFILE);
  }

  void onProductTap(ProductMargin product) {
    // Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
  }

  // ─── Private Format Helpers ───────────────────────────────────────────────
  String _formatRupiah(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
    return 'Rp $formatted';
  }

  String _formatAngka(double value) => value
      .toStringAsFixed(0)
      .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');

  String _formatAngkaShort(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(0)}jt';
    }
    return _formatAngka(value);
  }
}

// ─── Model ────────────────────────────────────────────────────────────────────
class ProductMargin {
  final String nama;
  final double hargaJual;
  final double hpp;

  ProductMargin({
    required this.nama,
    required this.hargaJual,
    required this.hpp,
  });

  double get margin => hargaJual - hpp;
  double get marginPersen => (margin / hargaJual) * 100;
  bool get isRugi => margin < 0;

  String get marginPersenFormatted => '${marginPersen.toStringAsFixed(1)}%';

  String get marginNominalFormatted {
    final abs = margin.abs().toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
    return isRugi ? '(-Rp $abs)' : 'Rp $abs';
  }

  String get hargaJualFormatted {
    final f = hargaJual.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
    return 'Jual: Rp $f';
  }

  String get hppFormatted {
    final f = hpp.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
    return 'Rp $f';
  }
}