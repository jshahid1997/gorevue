import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryText = Color(0xFF333333);
  static const Color secondaryText = Color(0xFF666666);
  static const Color accent = Color(0xFF1E88E5);
  static const Color background = Color(0xFFFAFAFA);
  static const Color cardBackground = Colors.white;
}

class AppSizes {
  static const double mobileWidth = 600;
  static const double tabletWidth = 1024;
}

class AppPadding {
  static const EdgeInsets small = EdgeInsets.all(8.0);
  static const EdgeInsets medium = EdgeInsets.all(16.0);
  static const EdgeInsets large = EdgeInsets.all(24.0);
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryText,
  );
}
