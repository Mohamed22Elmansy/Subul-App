import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../theme_cache_helper.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final themeIndex = await ThemeCacheHelper.getCacheThemeIndex();
        final theme = AppTheme.values
            .firstWhere((apptheme) => apptheme.index == themeIndex);
        emit(LoadedThemeState(
            themeData: appThemeData[theme]!, themeindex: themeIndex));
      } else if (event is ThemeChangeEvent) {
        final themeIndex = event.theme.index;
        await ThemeCacheHelper.cacheThemeIndex(themeIndex);
        emit(LoadedThemeState(
            themeData: appThemeData[event.theme]!, themeindex: themeIndex));
      }
    });
  }
}
