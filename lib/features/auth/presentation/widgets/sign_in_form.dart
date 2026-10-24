import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';
import 'package:spotify/core/service/spacing.dart';
import 'package:spotify/features/auth/presentation/logic/auth_bloc.dart';
import 'package:spotify/features/auth/presentation/logic/auth_event.dart';
import 'package:spotify/features/auth/presentation/logic/auth_state.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
            SignInRequested(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            controller: _emailController,
            focusNode: _emailFocus,
            label: AppStrings.usernameOrEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
            validator: (v) => (v == null || v.trim().isEmpty)
                ? AppStrings.emailRequired
                : null,
          ),
          verticalSpace(16),
          AuthTextField(
            controller: _passwordController,
            focusNode: _passwordFocus,
            label: AppStrings.password,
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            suffixIcon: IconButton(
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: onSurface.withValues(alpha: 0.4),
              ),
            ),
            validator: (v) => (v == null || v.length < 6)
                ? AppStrings.passwordTooShort
                : null,
          ),
          verticalSpace(12),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
              onTap: () {
                // TODO: Password Screen
              },
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  AppStrings.recoveryPassword,
                  style: TextStyle(
                    color: onSurface.withValues(alpha: 0.7),
                    fontSize: AppTextSizes.sm,
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(28),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return SizedBox(
                width: double.infinity,
                height: 64.h,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  child: isLoading
                      ? SizedBox(
                          width: 24.r,
                          height: 24.r,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(AppStrings.signIn),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}