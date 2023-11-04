part of 'pick_files_from_device_cubit.dart';

@immutable
abstract class PickFilesFromDeviceState {
  final String? filePath;

  const PickFilesFromDeviceState({required this.filePath});
}

class PickFilesFromDeviceInitial extends PickFilesFromDeviceState {
  const PickFilesFromDeviceInitial({required super.filePath});
}

class FilePickedFromDeviceSuccessfully extends PickFilesFromDeviceState {
  const FilePickedFromDeviceSuccessfully({required super.filePath});
}

class FilePickingFromDeviceError extends PickFilesFromDeviceState {
  const FilePickingFromDeviceError({required super.filePath});
}
