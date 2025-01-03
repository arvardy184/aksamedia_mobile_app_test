import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:flutter/material.dart';
class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final Color? selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ColorSelector({
    Key? key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Warna',
          style: AppTypography.bodyRegularNormal,
        ),
        const SizedBox(height: 8),
        Row(
          children: colors.map((color) {
            final bool isSelected = color == selectedColor;
            return GestureDetector(
              onTap: () => onColorSelected(color),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: Colors.black, width: 2)
                      : Border.all(color: Colors.grey),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}