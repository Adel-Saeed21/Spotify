import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';
import 'package:spotify/core/config/theme/font_weight_helper.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        textStyle:  TextStyle(
          color: Colors.white,
          fontSize: AppTextSizes.xl,
          fontWeight: FontWeightHelper.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: 'Satoshi',
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: AppTextSizes.xl,
          fontWeight: FontWeightHelper.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      ),
    ),
  );
}
