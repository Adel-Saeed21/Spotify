import 'package:flutter/material.dart';
import 'package:spotify/core/config/assets/app_assets.dart';

class GetStartLogo extends StatelessWidget {
  const GetStartLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.assetsImagesVector);
  }
}
