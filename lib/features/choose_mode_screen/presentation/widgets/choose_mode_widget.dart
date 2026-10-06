import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify/core/config/assets/app_strings.dart';
import 'package:spotify/core/config/theme/theme_cubit/theme_cubit.dart';

import 'choose_mode_button.dart';

class ChooseModeWidget extends StatelessWidget {
  const ChooseModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = context.watch<ThemeCubit>().state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChooseModeButton(
          icon: Icons.nightlight_round,
          title: AppStrings.darkModeText,
          isSelected: mode == ThemeMode.dark,
          onTap: () => context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
        ),
        SizedBox(width: 40.w),
        ChooseModeButton(
          icon: Icons.wb_sunny_outlined,
          title: AppStrings.lightModeText,
          isSelected: mode == ThemeMode.light,
          onTap: () => context.read<ThemeCubit>().updateTheme(ThemeMode.light),
        ),
      ],
    );
  }
}
