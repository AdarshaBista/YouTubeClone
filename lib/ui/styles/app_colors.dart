import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFFFF0000);
  static const primaryDark = Color(0xFF8F0000);
  static final primaryLight = primary.withOpacity(0.3);

  static const dark = Color(0xFF151515);
  static const darkAccent = Color(0xFF353535);
  static const darkSurface = Color(0xFF252525);
  static final darkFaded = dark.withOpacity(0.6);

  static const light = Color(0xFFFFFFFF);
  static const lightAccent = Color(0xFFE5E5F5);
  static final lightFaded = light.withOpacity(0.6);
}
