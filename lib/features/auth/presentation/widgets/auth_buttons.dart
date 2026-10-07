import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/font_weight_helper.dart';
import 'package:spotify/core/service/spacing.dart';

class AuthButtons extends StatelessWidget {
  final VoidCallback onRegister;
  final VoidCallback onSignIn;

  const AuthButtons({
    super.key,
    required this.onRegister,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onRegister,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 24.h),
            ),
            child: Text(
              AppStrings.register,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.semiBold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        horizontalSpace(20),
        Expanded(
          child: TextButton(
            onPressed: onSignIn,
            child: Text(
              AppStrings.signIn,
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeightHelper.medium,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}