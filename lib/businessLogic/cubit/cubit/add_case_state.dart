part of 'add_case_cubit.dart';

sealed class AddCaseState extends Equatable {
  const AddCaseState();

  @override
  List<Object> get props => [];
}

final class AddCaseInitial extends AddCaseState {}

final class AddCaseAdding extends AddCaseState {}

final class AddCaseSuccess extends AddCaseState {}

final class AddCaseFailed extends AddCaseState {}
