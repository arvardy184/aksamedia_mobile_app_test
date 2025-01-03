import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    primaryColor: AppColors.primary[500],
    scaffoldBackgroundColor: AppColors.gray[50],
    colorScheme: ColorScheme.light(
      primary: AppColors.primary[500]!,
      secondary: AppColors.secondary[500]!,
      error: AppColors.danger[500]!,
      surface: AppColors.gray[100]!,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onError: Colors.white,
      onSurface: AppColors.gray[800]!,
    ),
    textTheme: const TextTheme(
      titleLarge: AppTypography.title1,
      titleMedium: AppTypography.title2,
      titleSmall: AppTypography.title3,
      bodyMedium: AppTypography.bodyRegularNormal,
      bodySmall: AppTypography.bodySmallNormal,
    ),
     elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary[950], // Set warna tombol utama
        foregroundColor: Colors.white, // Warna teks tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary[950], 
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.gray[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primary[500]!),
      ),
      contentPadding: const EdgeInsets.all(16),
    ),
  );

  // Dark Theme (Opsional)
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
    primaryColor: AppColors.primary[950],
    scaffoldBackgroundColor: AppColors.gray[900],
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary[500]!,
      secondary: AppColors.secondary[500]!,
      error: AppColors.danger[500]!,
      surface: AppColors.gray[800]!,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
      onSurface: AppColors.primary[300]!,
    ),
    textTheme: const TextTheme(
      titleLarge: AppTypography.title1,
      titleMedium: AppTypography.title2,
      titleSmall: AppTypography.title3,
      bodyMedium: AppTypography.bodyRegularNormal,
      bodySmall: AppTypography.bodySmallNormal,
    ),
     elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary[950], // Set warna tombol utama
        foregroundColor: Colors.white, // Warna teks tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary[950],
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
