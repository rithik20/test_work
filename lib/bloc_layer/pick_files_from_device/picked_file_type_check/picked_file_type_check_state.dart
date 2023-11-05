part of 'picked_file_type_check_cubit.dart';

@immutable
abstract class PickedFileTypeCheckState {
  final String selectedFileType;
  const PickedFileTypeCheckState({required this.selectedFileType});
}

class PickedFileTypeCheckInitial extends PickedFileTypeCheckState {
  const PickedFileTypeCheckInitial({required super.selectedFileType});
}

class IdentifiedFileTypeSuccessfully extends PickedFileTypeCheckState{
  const IdentifiedFileTypeSuccessfully({required super.selectedFileType});
}

class FileTypeRemoved extends PickedFileTypeCheckState{
  const FileTypeRemoved({required super.selectedFileType});
}

class FileTypeIdentificationError extends PickedFileTypeCheckState{
  const FileTypeIdentificationError({required super.selectedFileType});
}
