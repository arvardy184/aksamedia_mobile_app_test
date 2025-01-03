import 'package:flutter/material.dart';

class NewLabel extends StatelessWidget {
  const NewLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Colors.yellow,
      child: const Text(
        'New',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
