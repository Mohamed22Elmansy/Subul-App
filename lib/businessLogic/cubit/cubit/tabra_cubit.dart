import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabra_state.dart';

enum TabraType { Sadakat, Kafarat, Adahi }

class TabraCubit extends Cubit<TabraState> {
  TabraCubit() : super(TabraInitial());
  TabraType? tabraType;
  void tebraType(TabraType? value) {
    tabraType = value;
    if (tabraType == TabraType.Sadakat) {
      emit(TabraSadakat());
    } else if (tabraType == TabraType.Adahi) {
      emit(TabraAdahi());
    } else {
      emit(TabraKafarat());
    }
  }
}
