import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_assets.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/font_weight_helper.dart';
import 'package:spotify/core/service/spacing.dart';
import 'package:spotify/core/widgets/app_button.dart';
import 'package:spotify/features/choose_mode_screen/presentation/widgets/choose_mode_widget.dart';
import 'package:spotify/features/get_start_screen/presentation/widgets/get_start_logo.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.assetsImagesChooseModeBg, fit: BoxFit.cover),
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
                          Text(
                            AppStrings.chooseModeText,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeightHelper.bold,
                              color: Colors.white,
                            ),
                          ),
                          verticalSpace(40),
                          ChooseModeWidget(),
                          verticalSpace(80),
                          Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 360.w),
                              child: AppButton(
                                text: AppStrings.containueButtonText,
                                onPressed: () {},
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
