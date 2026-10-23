import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/routing/routes.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';
import 'package:spotify/core/config/theme/font_weight_helper.dart';
import 'package:spotify/core/service/navigation_extension.dart';
import 'package:spotify/core/service/spacing.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:spotify/features/auth/presentation/widgets/or_divider.dart';
import 'package:spotify/features/auth/presentation/widgets/register_form.dart';
import 'package:spotify/features/auth/presentation/widgets/social_auth_row.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              verticalSpace(16),
              AuthAppBar(),
              verticalSpace(40),
              Text(
                AppStrings.register,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeightHelper.semiBold,
                  fontSize: AppTextSizes.xxl,
                ),
              ),
              verticalSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppStrings.ifYouNeedAnySupport),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.clickHere,
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              verticalSpace(35),
              const RegisterForm(),
              verticalSpace(24),
              const OrDivider(),
              verticalSpace(24),
              const SocialAuthRow(),
              verticalSpace(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.doYouHaveAnAccount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppTextSizes.base,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.signInScreen);
                    },
                    child: Text(
                      AppStrings.signIn,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: AppTextSizes.base,
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}
