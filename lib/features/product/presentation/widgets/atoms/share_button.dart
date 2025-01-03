import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ShareButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: onPressed,
    );
  }
}
