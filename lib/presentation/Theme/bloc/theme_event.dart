part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentThemeEvent extends ThemeEvent {}

class ThemeChangeEvent extends ThemeEvent {
  final AppTheme theme;

  const ThemeChangeEvent({required this.theme});
  @override
  List<Object> get props => [theme];
}
