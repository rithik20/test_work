import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'pdf_view_bloc_state.dart';

class PdfViewBlocCubit extends Cubit<PdfViewBlocState> {
  PdfViewBlocCubit() : super(const PdfViewBlocInitial(path: ""));

  void pdfFilePath(String? filePath) {
    emit(PdfFilePathReceived(path: filePath));
  }
}
