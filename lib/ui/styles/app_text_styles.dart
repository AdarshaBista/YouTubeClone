import 'package:flutter/material.dart';

import 'package:youtube_clone/core/constants/configs.dart';

import 'package:youtube_clone/ui/styles/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const _base = TextStyle(
    color: AppColors.dark,
    fontFamily: AppConfig.fontFamily,
  );

  static final headline1 = _base.copyWith(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
  );

  static final headline2 = _base.copyWith(
    fontSize: 26.0,
    fontWeight: FontWeight.w600,
  );

  static final headline3 = _base.copyWith(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
  );

  static final headline4 = _base.copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );

  static final headline5 = _base.copyWith(
    fontSize: 15.0,
    color: AppColors.darkFaded,
    fontWeight: FontWeight.w300,
  );

  static final headline6 = _base.copyWith(
    fontSize: 11.0,
    color: AppColors.darkFaded,
    fontWeight: FontWeight.w200,
  );
}
