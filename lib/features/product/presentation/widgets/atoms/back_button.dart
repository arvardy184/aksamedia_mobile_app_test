import 'package:flutter/material.dart';

class BackButtonProduct extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonProduct({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed,
    );
  }
}
