import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial());
  File? image;
  Future<void> pickImage(ImageSource source) async {
    
    emit(PickImageLooding());
    try {
      final picker = ImagePicker();
      await picker.pickImage(source: source).then((value) {
        if (value != null) {
          emit(PickImageSuccess());
          image = File(value.path);
        } else {
          emit(PickImageFailed());
        }
      });
    } catch (e) {
      emit(PickImageFailed());
      return;
    }
  }
}
