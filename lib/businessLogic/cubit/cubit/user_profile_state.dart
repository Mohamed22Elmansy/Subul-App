part of 'user_profile_cubit.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

final class UserProfileInitial extends UserProfileState {}
final class UserIsLogin extends UserProfileState {}
final class UserNotLogin extends UserProfileState {}
final class UserLogOut extends UserProfileState {}
