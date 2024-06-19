part of 'regist_cubit.dart';

sealed class RegistState extends Equatable {
  const RegistState();

  @override
  List<Object> get props => [];
}

final class RegistInitial extends RegistState {}

final class RegistLooding extends RegistState {}

final class RegistSucsses extends RegistState {}

final class RegistFailuer extends RegistState {}

final class RegistMale extends RegistState {}

final class RegistFemale extends RegistState {}
