part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLooding extends ResetPasswordState {}

final class ResetPasswordSucsses extends ResetPasswordState {}

final class ResetPasswordFaild extends ResetPasswordState {}

final class ConfirmPasswordFaild extends ResetPasswordState {}

final class ConfirmPasswordLooding extends ResetPasswordState {}

final class ConfirmPasswordSucsses extends ResetPasswordState {}
