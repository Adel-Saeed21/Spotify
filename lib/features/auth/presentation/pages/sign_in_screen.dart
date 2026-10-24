import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/dependency_injection/get_it.dart';
import 'package:spotify/core/config/routing/routes.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';
import 'package:spotify/core/config/theme/font_weight_helper.dart';
import 'package:spotify/core/service/navigation_extension.dart';
import 'package:spotify/core/service/spacing.dart';
import 'package:spotify/features/auth/presentation/logic/auth_bloc.dart';
import 'package:spotify/features/auth/presentation/logic/auth_state.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:spotify/features/auth/presentation/widgets/or_divider.dart';
import 'package:spotify/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:spotify/features/auth/presentation/widgets/social_auth_row.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthSuccess) {
            // TODO: روح للـ Home
            // context.pushNamed(Routes.homeScreen);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(16),
                    const AuthAppBar(),
                    verticalSpace(40),
                    Text(
                      AppStrings.signIn,
                      style: TextStyle(
                        color: onSurface,
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: AppTextSizes.xxl,
                      ),
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.ifYouNeedAnySupport,
                          style: TextStyle(color: onSurface),
                        ),
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
                    const SignInForm(),
                    verticalSpace(24),
                    const OrDivider(),
                    verticalSpace(24),
                    const SocialAuthRow(),
                    verticalSpace(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.notAMember,
                          style: TextStyle(
                            color: onSurface,
                            fontSize: AppTextSizes.base,
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              context.pushNamed(Routes.registerScreen),
                          child: Text(
                            AppStrings.registerNow,
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
          ),
        ),
      ),
    );
  }
}