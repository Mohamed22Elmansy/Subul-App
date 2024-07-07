import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/data/server/cacheHelper.dart';

part 'booked_cases_state.dart';

class BookedCasesCubit extends Cubit<BookedCasesState> {
  BookedCasesCubit() : super(BookedCasesInitial());
  List<Map<String, dynamic>> bookedCase = [];
  int totalSallary = 0;
  int index = 0;
  void DeleteCase(int x) {
    emit(BookedCasesInitial());
    if (x == 0) {
      bookedCase = [];
      index = 0;
      totalSallary = 0;
    } else if (bookedCase.isNotEmpty) {
      totalSallary -= int.parse(bookedCase[x]["sallery"].toString());
      print(totalSallary);
      bookedCase.removeAt(x);

      index -= 1;
    }
    emit(BookedCasesdeleted());
  }

  void addCase({required String title, required int sallary}) {
    emit(BookedCasesadding());
    try {
      emit(BookedCasesadding());
      index += 1;
      print(totalSallary);
      totalSallary += sallary;
      print(totalSallary);
      bookedCase.add({"index": index, "title": title, "sallery": sallary});
      CacheHelper.BookCase(bookedCase, sallary).then((value) {
        emit(BookedCasesadded());
      });
    } catch (e) {
      return;
    }
  }

  void LoodBookedList() async {
    emit(BookedCasesadding());
    bookedCase = await CacheHelper.GetBookedCase();
    totalSallary = await CacheHelper.GetTotalSallary();
    emit(BookedCaseslooded());
  }
}
