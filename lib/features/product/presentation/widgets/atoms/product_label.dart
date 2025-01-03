import 'package:flutter/material.dart';

class ProductLabel extends StatelessWidget {
  final String text;

  const ProductLabel({
    super.key, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
