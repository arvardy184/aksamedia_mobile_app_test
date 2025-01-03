
import 'package:flutter/material.dart';
import '../../../../../app/theme/app_typography.dart';

class ShareOptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ShareOptionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Text(
              title,
              style: AppTypography.bodyRegular,
            ),
          ],
        ),
      ),
    );
  }
}