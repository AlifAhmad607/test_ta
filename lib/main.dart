import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Bindings/loginbinding.dart';
import 'package:test_ta/Bindings/main_binding.dart';
import 'package:test_ta/Bindings/main_kasir_binding.dart';
import 'package:test_ta/Pages/kasir/main_kasir_page.dart';
import 'package:test_ta/Routes/page.dart';
import 'package:test_ta/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Street',
      initialRoute: AppRoutes.DASHBOARDKASIR,
      getPages: AppPage.pages,
      initialBinding: MainKasirBinding(),
    );
  }
}
