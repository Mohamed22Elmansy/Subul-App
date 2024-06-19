part of 'login_page_cubit.dart';

sealed class LoginPageState extends Equatable {
  const LoginPageState();

  @override
  List<Object> get props => [];
}

final class LoginPageInitial extends LoginPageState {}

final class LoginPagelogining extends LoginPageState {}

final class LoginPagesucsses extends LoginPageState {}

final class LoginPagefailure extends LoginPageState {}

final class Passwordvisible extends LoginPageState {}

final class PasswordInvisible extends LoginPageState {}

final class LoginTypeUser extends LoginPageState {}

final class LoginTypeCharity extends LoginPageState {}
