import 'package:aksamedia_mobile_app_test/features/product/presentation/widgets/bottom_sheets/share_bottom_sheet.dart';
import 'package:flutter/material.dart';

void showCustomBottomSheet({
  required BuildContext context,
  double? height,
  Color? backgroundColor,
  bool isDismissible = true,
  bool enableDrag = true,
  BorderRadius? borderRadius,
}) {
  showModalBottomSheet(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: backgroundColor ?? Colors.white,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ?? const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    constraints: height != null 
      ? BoxConstraints(maxHeight: height)
      : null,
    builder: (_) => const ProductBottomSheetShare(),
  );
}