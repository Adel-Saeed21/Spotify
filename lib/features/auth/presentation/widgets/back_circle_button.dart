import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BackCircleButton extends StatelessWidget {
  final VoidCallback onTap;
  const BackCircleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Material(
      color: onSurface.withValues(alpha: 0.1),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 40.h,
          width: 40.h,
          child: Icon(Icons.arrow_back_ios_new, size: 16.sp, color: onSurface),
        ),
      ),
    );
  }
}
