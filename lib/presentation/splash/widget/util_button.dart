import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';

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
    // Lấy style từ ElevatedButtonTheme
    final ButtonStyle? defaultStyle =
        Theme.of(context).elevatedButtonTheme.style;

    return ElevatedButton(
      onPressed: onPressed,
      style: defaultStyle?.copyWith(
        minimumSize: MaterialStateProperty.all(Size.fromHeight(height ?? 22)),
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        foregroundColor: MaterialStateProperty.all(Colors.white),
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
