import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domains/configs/theme/app_colors.dart';
import '../../presentations/bloc/theme/theme_cubit.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? height;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle? defaultStyle =
        Theme.of(context).elevatedButtonTheme.style;
    final themeCubit = context.read<ThemeCubit>();
    final themeMode = themeCubit.state;

    return ElevatedButton(
      onPressed: onPressed,
      style: defaultStyle?.copyWith(
        minimumSize: MaterialStateProperty.all(Size.fromHeight(height ?? 22)),
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        foregroundColor: MaterialStateProperty.all(themeMode == ThemeMode.system
            ? Colors.white
            : themeMode == ThemeMode.light
                ? Colors.black
                : Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(222),
          ),
        ),
      ),
      child: Text(
        text,
        style: defaultStyle?.textStyle?.resolve({}),
      ),
    );
  }
}
