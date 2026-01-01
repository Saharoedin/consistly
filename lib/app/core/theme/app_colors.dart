import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static Color get primary => Get.theme.colorScheme.primary;
  static Color get background => Get.theme.colorScheme.background;
  static Color get surface => Get.theme.colorScheme.surface;

  static Color get textPrimary => Get.theme.textTheme.bodyLarge!.color!;
  static Color get textSecondary => Get.theme.textTheme.bodyMedium!.color!;

  static Color get success => Colors.green;
  static Color get warning => Colors.orange;
  static Color get error => Colors.red;
}
