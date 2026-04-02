import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ta/Controllers/settingcontroller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        title: const Text("Pengaturan"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: controller.save,
            child: const Text("Simpan",
                style: TextStyle(color: Colors.orange)),
          )
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Pengaturan Sistem",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),

              const SizedBox(height: 4),

              const Text(
                "Kelola operasional dan identitas kedai Anda di sini.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 16),

              // 🔻 PROFIL TOKO
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Profil Toko",
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    const SizedBox(height: 16),

                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.brown,
                            child: const Icon(Icons.coffee, color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          const Text("Ganti Logo Toko",
                              style: TextStyle(color: Colors.orange)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    _label("NAMA TOKO"),
                    _input("Coffee Street Jakarta"),

                    const SizedBox(height: 12),

                    _label("ALAMAT LENGKAP"),
                    _input("Jl. Sudirman No. 123, SCBD, Jakarta Selatan"),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔻 MANAJEMEN ROLE
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Manajemen Role",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 16),
                          label: const Text("Tambah"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade50,
                            foregroundColor: Colors.orange,
                            elevation: 0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 12),

                    _roleItem(
                      title: "Owner",
                      subtitle: "Full Access, Settings, Reports",
                    ),

                    const SizedBox(height: 8),

                    _roleItem(
                      title: "Barista",
                      subtitle: "Order Management, Stock Check",
                    ),

                    const SizedBox(height: 8),

                    _roleItem(
                      title: "Kasir",
                      subtitle: "Transactions, Daily Closing",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔻 METODE PEMBAYARAN
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Metode Pembayaran",
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    const SizedBox(height: 12),

                    _switch("Tunai (Cash)", controller.isTunai,
                        controller.toggleTunai),
                    _switch("QRIS / E-Wallet", controller.isQris,
                        controller.toggleQris),
                    _switch("Bank Transfer", controller.isBank,
                        controller.toggleBank),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔻 QRIS
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Pengaturan QRIS",
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    const SizedBox(height: 12),

                    _label("MERCHANT ID"),
                    _input("MID-823910231"),

                    const SizedBox(height: 12),

                    _label("API KEY"),
                    _input("sk_test_XXXX", isPassword: true),

                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Gunakan API Key dari dashboard Payment Gateway Anda untuk mengaktifkan pembayaran QRIS otomatis.",
                        style:
                            TextStyle(fontSize: 12, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: controller.save,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.save),
      ),
    );
  }

  // 🔲 CARD
  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  // 🔤 LABEL
  Widget _label(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 12, color: Colors.grey));
  }

  // 🔤 INPUT
  Widget _input(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // 🔘 SWITCH
  Widget _switch(String title, RxBool value, Function(bool) onChanged) {
    return Obx(() => SwitchListTile(
          value: value.value,
          onChanged: (val) => onChanged(val),
          title: Text(title),
          activeColor: Colors.orange,
        ));
  }

  // 👤 ROLE ITEM
  Widget _roleItem({
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 18),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, size: 18),
          ),
        ],
      ),
    );
  }
}