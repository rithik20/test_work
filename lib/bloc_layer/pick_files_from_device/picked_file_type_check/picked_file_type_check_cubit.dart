import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

part 'picked_file_type_check_state.dart';

class PickedFileTypeCheckCubit extends Cubit<PickedFileTypeCheckState> {
  PickedFileTypeCheckCubit()
      : super(const PickedFileTypeCheckInitial(selectedFileType: ""));

  void checkThisFileType(String? type) {
    String? extensionType = lookupMimeType(type!);
    if (extensionType != null) {
      emit(IdentifiedFileTypeSuccessfully(selectedFileType: extensionType));
    } else {
      emit(const FileTypeIdentificationError(selectedFileType: ""));
    }
  }

  void resetFileType() {
    emit(const FileTypeRemoved(selectedFileType: ""));
  }
}
