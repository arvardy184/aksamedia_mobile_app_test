import 'package:flutter/material.dart';

class PackageSelector extends StatelessWidget {
  final List<String> packages;
  final String selectedPackage;
  final ValueChanged<String> onPackageSelected;

  const PackageSelector({
    super.key,
    required this.packages,
    required this.selectedPackage,
    required this.onPackageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: packages.map((p) {
        final bool isSelected = (p == selectedPackage);
        return ChoiceChip(
          label: Text(p),
          selected: isSelected,
          onSelected: (_) => onPackageSelected(p),
        );
      }).toList(),
    );
  }
}
