import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_assets.dart';

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow({super.key, this.onGoogleTap, this.onAppleTap});

  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialIcon(
          asset: Assets.assetsImagesGoogleIcon,
          onTap: onGoogleTap,
        ),
        SizedBox(width: 48.w),
        _SocialIcon(
          asset: Assets.assetsImagesAppleIcon,
          onTap: onAppleTap,
          tintByTheme: true, 
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({
    required this.asset,
    this.onTap,
    this.tintByTheme = false,
  });

  final String asset;
  final VoidCallback? onTap;
  final bool tintByTheme;

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Image.asset(
          asset,
          width: 32.w,
          height: 32.h,
          color: tintByTheme ? onSurface : null,
        ),
      ),
    );
  }
}