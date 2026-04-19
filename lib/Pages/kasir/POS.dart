import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/POScontroller.dart';
import 'package:test_ta/reusablecomponent/categorychip.dart';
import 'package:test_ta/reusablecomponent/productcard.dart';


class PosPage extends StatelessWidget{
   PosPage({super.key});

  final controller = Get.put(PosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              // 🔻 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Coffee Street",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("Kasir: Ahmad Fauzi",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.notifications_none)
                ],
              ),

              const SizedBox(height: 16),

              // 🔻 SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari menu kopi...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 🔻 CATEGORY
              SizedBox(
                height: 40,
                child: Obx(() => ListView(
                      scrollDirection: Axis.horizontal,
                      children: controller.categories.map((e) {
                        return CategoryChip(
                          label: e,
                          isActive: controller.selectedCategory.value == e,
                          onTap: () => controller.changeCategory(e),
                        );
                      }).toList(),
                    )),
              ),

              const SizedBox(height: 16),

              // 🔻 PRODUCT GRID
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: const [

                    ProductCard(
                      title: "Espresso Double",
                      price: "Rp 18.000",
                      image: "https://picsum.photos/200",
                    ),

                    ProductCard(
                      title: "Caffe Latte",
                      price: "Rp 25.000",
                      image: "https://picsum.photos/200",
                    ),

                    ProductCard(
                      title: "Cold Brew",
                      price: "Rp 28.000",
                      image: "https://picsum.photos/200",
                    ),

                    ProductCard(
                      title: "Cappuccino",
                      price: "Rp 24.000",
                      image: "https://picsum.photos/200",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}