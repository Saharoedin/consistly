import 'package:consistly/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? fontColor;

  const PrimaryButton({
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        minimumSize: Size(double.infinity, 56),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: fontColor ?? Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
