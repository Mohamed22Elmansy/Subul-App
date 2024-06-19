part of 'home_page_cubit.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageSelect extends HomePageState {}

final class SecondSelect extends HomePageState {}

final class ThirdPageSelect extends HomePageState {}
