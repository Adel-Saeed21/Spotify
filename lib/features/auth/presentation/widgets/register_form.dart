import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/service/spacing.dart';
import 'package:spotify/features/auth/presentation/logic/auth_bloc.dart';
import 'package:spotify/features/auth/presentation/logic/auth_event.dart';
import 'package:spotify/features/auth/presentation/logic/auth_state.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
            RegisterRequested(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            controller: _nameController,
            focusNode: _nameFocus,
            label: AppStrings.fullName,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _emailFocus.requestFocus(),
            validator: (v) => (v == null || v.trim().isEmpty)
                ? AppStrings.nameRequired
                : null,
          ),
          verticalSpace(16),
          AuthTextField(
            controller: _emailController,
            focusNode: _emailFocus,
            label: AppStrings.enterEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return AppStrings.emailRequired;
              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim())) {
                return AppStrings.emailInvalid;
              }
              return null;
            },
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
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white38
                    : Colors.black38,
              ),
            ),
            validator: (v) => (v == null || v.length < 6)
                ? AppStrings.passwordTooShort
                : null,
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
                      : const Text(AppStrings.createAccount),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}