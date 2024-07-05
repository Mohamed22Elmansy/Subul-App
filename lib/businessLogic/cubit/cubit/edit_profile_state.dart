part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLooding extends EditProfileState {}

final class EditProfileFailed extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {}
