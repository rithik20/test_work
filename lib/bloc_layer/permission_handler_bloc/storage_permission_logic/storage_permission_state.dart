part of 'storage_permission_cubit.dart';

@immutable
abstract class StoragePermissionStatusState {
  final PermissionStatus storagePermissionStatus;

  const StoragePermissionStatusState({required this.storagePermissionStatus});
}

class InitialStoragePermissionStatus extends StoragePermissionStatusState {
  const InitialStoragePermissionStatus(
      {required super.storagePermissionStatus});
}

class StoragePermissionGranted extends StoragePermissionStatusState {
  const StoragePermissionGranted({required super.storagePermissionStatus});
}

class StoragePermissionDenied extends StoragePermissionStatusState {
  const StoragePermissionDenied({required super.storagePermissionStatus});
}

class StoragePermissionPermanentlyDenied extends StoragePermissionStatusState {
  const StoragePermissionPermanentlyDenied(
      {required super.storagePermissionStatus});
}
