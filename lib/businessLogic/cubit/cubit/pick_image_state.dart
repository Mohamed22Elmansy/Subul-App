part of 'pick_image_cubit.dart';

sealed class PickImageState extends Equatable {
  const PickImageState();

  @override
  List<Object> get props => [];
}

final class PickImageInitial extends PickImageState {}

final class PickImageLooding extends PickImageState {}

final class PickImageSuccess extends PickImageState {}

final class PickImageFailed extends PickImageState {}
