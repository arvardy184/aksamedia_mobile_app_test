import 'package:aksamedia_mobile_app_test/app/theme/app_colors.dart';
import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingSkipButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 16,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "Lewati",
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.primary[800],
          ),
        ),
      ),
    );
  }
}
