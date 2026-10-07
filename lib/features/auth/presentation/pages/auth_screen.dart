import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/config/routing/routes.dart';
import 'package:spotify/core/service/navigation_extension.dart';
import 'package:spotify/core/service/spacing.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_background.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_buttons.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_header.dart';
import 'package:spotify/features/auth/presentation/widgets/back_circle_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          const AuthBackground(),
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
                          verticalSpace(16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: BackCircleButton(onTap: () => context.pop()),
                          ),
                          const Spacer(flex: 2),
                          const AuthHeader(),
                          verticalSpace(40),
                          AuthButtons(
                            onRegister: () => context.push(Routes.registerScreen),
                            onSignIn: () => context.push(Routes.signInScreen),
                          ),
                          const Spacer(),
                          SizedBox(height: size.height * 0.28),
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
