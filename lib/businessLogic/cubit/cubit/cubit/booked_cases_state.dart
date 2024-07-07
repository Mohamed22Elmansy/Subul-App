part of 'booked_cases_cubit.dart';

sealed class BookedCasesState extends Equatable {
  const BookedCasesState();

  @override
  List<Object> get props => [];
}

final class BookedCasesInitial extends BookedCasesState {}

final class BookedCaseslooded extends BookedCasesState {}

final class BookedCasesfailed extends BookedCasesState {}

final class BookedCasesadding extends BookedCasesState {}

final class BookedCasesadded extends BookedCasesState {}
final class BookedCasesdeleted extends BookedCasesState {}
