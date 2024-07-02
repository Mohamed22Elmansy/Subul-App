part of 'tabra_cubit.dart';

sealed class TabraState extends Equatable {
  const TabraState();

  @override
  List<Object> get props => [];
}

final class TabraInitial extends TabraState {}

final class TabraSadakat extends TabraState {}

final class TabraKafarat extends TabraState {}

final class TabraAdahi extends TabraState {}
