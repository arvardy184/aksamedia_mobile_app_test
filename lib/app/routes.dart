import 'package:aksamedia_mobile_app_test/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String productDetail = '/product-detail';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onboarding: (_) => const OnboardingScreen(),
      // productDetail: (_) => const ProductDetailScreen(),
    };
  }
}