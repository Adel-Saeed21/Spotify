import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/service/spacing.dart';

class GetStartMessage extends StatelessWidget {
  const GetStartMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.enjoyListeningToMusic,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        verticalSpace(10),
        Text(
          AppStrings.getStartSecondText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.gray,
          ),
        ),
      ],
    );
  }
}
