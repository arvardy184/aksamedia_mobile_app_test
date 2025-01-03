import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String description;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;
  final VoidCallback? onCopy;

  const DescriptionSection({
    super.key,
    required this.description,
    required this.isExpanded,
    required this.onToggleExpanded,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    final displayedText = isExpanded
        ? description
        : (description.length > 80
            ? '${description.substring(0, 80)}...'
            : description);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Deskripsi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              icon:  Icon(Icons.copy_all_outlined,color: AppColors.info[500],),
              onPressed: onCopy ?? () {},
            ),
          ],
        ),
        Text(displayedText),
        if (description.length > 80)
          Center(
            child: TextButton(
              onPressed: onToggleExpanded,
              child: Text(isExpanded ? 'Tutup' : 'Selengkapnya',style: TextStyle(color: 
              AppColors.info[500]),),
            ),
          ),
      ],
    );
  }
}
