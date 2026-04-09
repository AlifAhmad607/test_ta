import 'package:get/get.dart';
import 'package:test_ta/Bindings/loginbinding.dart';
import 'package:test_ta/Bindings/main_binding.dart';
import 'package:test_ta/Bindings/main_kasir_binding.dart';
import 'package:test_ta/Pages/analisisPage.dart';
import 'package:test_ta/Pages/dashboardpage.dart';
import 'package:test_ta/Pages/kasir/main_kasir_page.dart';
import 'package:test_ta/Pages/loginpage.dart';
import 'package:test_ta/Pages/main_page.dart';
import 'package:test_ta/Pages/manajemenHPP.dart';
import 'package:test_ta/Pages/settingpage.dart';
import 'package:test_ta/Routes/routes.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const Dashboardpage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.Analisis,
      page: () => const AnalisisPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.Manajemen,
      page: () => const ManajemenPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARDKASIR,
      page: () => const MainKasirPage(),
      binding: MainKasirBinding(),
    ),
  ];
}
