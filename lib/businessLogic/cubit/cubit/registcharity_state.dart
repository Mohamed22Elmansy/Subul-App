part of 'registcharity_cubit.dart';

sealed class RegistcharityState extends Equatable {
  const RegistcharityState();

  @override
  List<Object> get props => [];
}

final class RegistcharityInitial extends RegistcharityState {}
final class RegistcharitySelsctingData extends RegistcharityState {}
final class RegistcharityDataSelected extends RegistcharityState {}
final class RegistcharityRegisting extends RegistcharityState {}
final class RegistcharitySuccess extends RegistcharityState {}
final class RegistcharityFailed extends RegistcharityState {}
