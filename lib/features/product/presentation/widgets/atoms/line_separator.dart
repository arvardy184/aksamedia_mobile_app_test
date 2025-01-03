import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 1,
      color: Colors.grey,
    );
  }
}
