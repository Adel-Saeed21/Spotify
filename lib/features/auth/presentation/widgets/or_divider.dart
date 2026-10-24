import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final lineColor = onSurface.withValues(alpha: 0.2);

    return Row(
      children: [
        Expanded(child: Divider(color: lineColor, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            AppStrings.or,
            style: TextStyle(
              color: onSurface.withValues(alpha: 0.5),
              fontSize: AppTextSizes.sm,
            ),
          ),
        ),
        Expanded(child: Divider(color: lineColor, thickness: 1)),
      ],
    );
  }
}