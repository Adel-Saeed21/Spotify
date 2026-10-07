import 'package:flutter/material.dart';
import 'package:spotify/core/config/assets/app_assets.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            Assets.assetsImagesLowerDesign,
            width: size.width * 0.45,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            Assets.assetsImagesUperDesign,
            width: size.width * 0.4,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            Assets.assetsImagesAuthBg,
            height: size.height * 0.38,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}