import 'package:flutter/material.dart';

class ProductLabel extends StatelessWidget {
  final String text;

  const ProductLabel({
    Key? key, 
    required this.text,
  }) : super(key: key);

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
