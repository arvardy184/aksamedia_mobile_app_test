import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 1,
      color: Colors.grey,
    );
  }
}
