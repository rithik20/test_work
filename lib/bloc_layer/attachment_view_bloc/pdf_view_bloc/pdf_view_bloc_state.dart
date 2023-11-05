part of 'pdf_view_bloc_cubit.dart';

@immutable
abstract class PdfViewBlocState {
  final String? path;
  const PdfViewBlocState({required this.path});
}

class PdfViewBlocInitial extends PdfViewBlocState {
  const PdfViewBlocInitial({required super.path});
}

class PdfFilePathReceived extends PdfViewBlocState{
  const PdfFilePathReceived({required super.path});
}
