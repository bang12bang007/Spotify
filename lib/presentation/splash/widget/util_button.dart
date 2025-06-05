import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';
import 'package:flutter_application_1/presentation/splash/bloc/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UtilButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? height;

  const UtilButton({
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
        minimumSize: WidgetStateProperty.all(Size.fromHeight(height ?? 22)),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(themeMode == ThemeMode.system
            ? Colors.white
            : themeMode == ThemeMode.light
                ? Colors.black
                : Colors.white),
        shape: WidgetStateProperty.all(
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
