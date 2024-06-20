import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation/presentation/Screens/Home_Screen.dart';
import 'package:graduation/presentation/Screens/UserProfile.dart';
import 'package:graduation/presentation/Screens/registScreen.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  Widget activePage = HomeScreen();

  void selectPage(int index) {
    if (index == 1) {
      emit(SecondSelect());
      activePage = UserProfile();
    } else if (index == 2) {
      emit(ThirdPageSelect());
      activePage = RegistScreen();
    } else {
      emit(HomePageSelect());
      activePage = HomeScreen();
    }
  }
}
