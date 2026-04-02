import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Bindings/loginbinding.dart';
import 'package:test_ta/Bindings/settingsbinding.dart';
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
      initialRoute: AppRoutes.SETTINGS,
      getPages: AppPage.pages,
      initialBinding: SettingsBinding (),
    );
  }
}