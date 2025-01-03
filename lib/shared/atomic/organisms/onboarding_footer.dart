import 'package:aksamedia_mobile_app_test/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardingFooter extends StatelessWidget {
  final String title;
  final String description;
  final bool isLastPage;
  final VoidCallback onNext;

  const OnboardingFooter({
    required this.title,
    required this.description,
    required this.isLastPage,
    required this.onNext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: AppTypography.title3, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Text(description, style: AppTypography.bodySmallNormal, textAlign: TextAlign.center),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Selanjutnya",
                style: AppTypography.bodySmallTight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
