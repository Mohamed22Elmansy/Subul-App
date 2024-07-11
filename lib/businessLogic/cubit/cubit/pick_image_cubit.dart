import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial());
  File? image;
  String? fileName;
  MultipartFile? photo;
  Future<void> pickImage(ImageSource source) async {
    emit(PickImageLooding());
    try {
      final picker = ImagePicker();
      await picker.pickImage(source: source).then((value) async {
        if (value != null) {
          emit(PickImageSuccess());
          image = File(value.path);
           fileName = image!.path.split('/').last;
          photo = await MultipartFile.fromFile(image!.path, filename: fileName);
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
