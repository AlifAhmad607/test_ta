import 'package:flutter/material.dart';

class StockModel {
  final String name;
  final double amount;
  final String unit;
  final String status; // 'AMAN' atau 'RENDAH'
  final IconData icon;

  StockModel({required this.name, required this.amount, required this.unit, required this.status, required this.icon});
}

class TransactionModel {
  final String title;
  final String time;
  final String paymentMethod;
  final String price;
  final IconData icon;

  TransactionModel({required this.title, required this.time, required this.paymentMethod, required this.price, required this.icon});
}