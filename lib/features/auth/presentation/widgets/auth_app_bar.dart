import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/config/assets/app_assets.dart';
import 'package:spotify/features/auth/presentation/widgets/back_circle_button.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: BackCircleButton(onTap: () => context.pop()),
        ),
        Image.asset(
          Assets.assetsImagesVector,
          width: size.width * 0.3,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
