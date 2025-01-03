// features/product/presentation/widgets/molecules/share_option_widget.dart

import 'package:flutter/material.dart';

class ShareOptionWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ShareOptionWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
