import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/config/theme/app_text_sizes.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.focusNode,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.validator,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: AppColors.primaryColor,
      style: TextStyle(color: Colors.white, fontSize: AppTextSizes.base),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: const Color(0xff1B1B1B),
        labelStyle: TextStyle(
          color: AppColors.gray,
          fontSize: AppTextSizes.base,
        ),
        floatingLabelStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: AppTextSizes.base,
        ),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.h),
        enabledBorder: _border(Colors.white10),
        focusedBorder: _border(AppColors.primaryColor, width: 1.5),
        errorBorder: _border(Colors.redAccent),
        focusedErrorBorder: _border(Colors.redAccent, width: 1.5),
      ),
    );
  }
}
