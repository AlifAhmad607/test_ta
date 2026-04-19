import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String text;

  const CustomLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12, color: Colors.grey),
    );
  }
}