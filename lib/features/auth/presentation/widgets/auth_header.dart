import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_assets.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/config/theme/font_weight_helper.dart';
import 'package:spotify/core/service/spacing.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        Image.asset(
          Assets.assetsImagesVector,
          width: size.width * 0.55,
          fit: BoxFit.contain,
        ),
        verticalSpace(40),
        Text(
          AppStrings.enjoyListeningToMusicText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeightHelper.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        verticalSpace(16),
        Text(
          AppStrings.enjoyListeningToMusicSecondText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
            color: AppColors.gray,
          ),
        ),
      ],
    );
  }
}