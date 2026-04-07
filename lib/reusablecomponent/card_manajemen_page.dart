import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/ManajemenController.dart';

class CardLabaHarian extends GetView<Manajemencontroller> {
  const CardLabaHarian({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'EST. LABA HARIAN',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 0.5,
                  ),
                ),
                const Spacer(),
                Icon(
                  controller.trendIconData,
                  color: controller.trendColor,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              controller.labaHarianFormatted,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  controller.arrowIconData,
                  color: controller.trendColor,
                  size: 12,
                ),
                const SizedBox(width: 2),
                Text(
                  controller.persenKemarinFormatted,
                  style: TextStyle(
                    fontSize: 11,
                    color: controller.trendColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardLabaBulanan extends GetView<Manajemencontroller> {
  const CardLabaBulanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'EST. LABA BULANAN',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9E9E9E),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              controller.labaBulananFormatted,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              controller.targetLabaFormatted,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF9E9E9E),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardProductItem extends GetView<Manajemencontroller> {
  final dynamic product;

  const CardProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onProductTap(product),
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          color: controller.cardColor(product),
          border: controller.cardBorder(product),
          borderRadius: BorderRadius.circular(12),
          boxShadow: controller.cardShadow(product),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.nama,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: controller.productNameColor(product),
                          ),
                        ),
                        if (product.isRugi) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.warning_amber_rounded,
                            color: Color(0xFFEF5350),
                            size: 16,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product.hargaJualFormatted,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9E9E9E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  product.hppFormatted,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4A4A6A),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      product.marginPersenFormatted,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: controller.marginColor(product),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product.marginNominalFormatted,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: controller.marginNominalColor(product),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
