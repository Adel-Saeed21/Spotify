import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/config/assets/app_assets.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/routing/routes.dart';
import 'package:spotify/core/service/spacing.dart';
import 'package:spotify/core/widgets/app_button.dart';
import 'package:spotify/features/get_start_screen/presentation/widgets/get_start_logo.dart';
import 'package:spotify/features/get_start_screen/presentation/widgets/get_start_message.dart';
class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.assetsImagesIntroBg, fit: BoxFit.cover),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          verticalSpace(30),
                          const GetStartLogo(),
                          const Spacer(),
                          const GetStartMessage(),
                          verticalSpace(40),
                          Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 360.w),
                              child: AppButton(
                                text: AppStrings.getStartButtonText,
                                onPressed: () {
                                  context.go(Routes.chooseModeScreen);
                                },
                              ),
                            ),
                          ),
                          verticalSpace(40),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
