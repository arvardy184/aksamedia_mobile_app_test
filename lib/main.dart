// main.dart
import 'package:aksamedia_mobile_app_test/app/theme/app_theme.dart';
import 'package:aksamedia_mobile_app_test/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}