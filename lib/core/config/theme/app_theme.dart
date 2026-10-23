import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';
import 'package:spotify/core/config/theme/font_weight_helper.dart';

class AppTheme {
  AppTheme._();

  static const String _fontFamily = 'Satoshi';

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: AppTextSizes.lg,
          fontWeight: FontWeightHelper.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
    );
  }

  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    elevatedButtonTheme: _elevatedButtonTheme,
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    elevatedButtonTheme: _elevatedButtonTheme,
  );
}
