import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  void toggleTheme() {
    state == ThemeMode.dark ? emit(ThemeMode.light) : emit(ThemeMode.dark);
  }
}
