part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

class LoadedThemeState extends ThemeState {
  final ThemeData themeData;
  final int themeindex;

  const LoadedThemeState({required this.themeData, required this.themeindex});

  @override
  List<Object> get props => [themeData];
}
