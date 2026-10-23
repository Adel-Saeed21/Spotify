import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            AppStrings.or,
            style: TextStyle(
              color: Colors.white38,
              fontSize: AppTextSizes.sm,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Colors.white12, thickness: 1)),      ],
    );
  }
}