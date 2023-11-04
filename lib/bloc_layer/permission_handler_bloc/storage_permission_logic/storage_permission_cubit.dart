import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'storage_permission_state.dart';

late PermissionStatus permissionStatus;

class StoragePermissionStatusCubit extends Cubit<StoragePermissionStatusState> {
  StoragePermissionStatusCubit()
      : super(InitialStoragePermissionStatus(
            storagePermissionStatus: permissionStatus));

  PermissionStatus storageStatus = permissionStatus;

  ///Use this [checkStoragePermissionStatus] method to get the storagePermissionStatus
  ///this method is used in the
  Future<void> checkStoragePermissionStatus() async {
    storageStatus = await Permission.storage.status;

    ///if the storage permission is not granted then call the request()
    ///method in the Permission handler package
    if (storageStatus == PermissionStatus.denied) {
      emit(const StoragePermissionDenied(
          storagePermissionStatus: PermissionStatus.denied));
      await Permission.storage.request();
    }

    ///If permanently denied open the Settings of the user's device and set the permission
    ///manually
    else if (storageStatus == PermissionStatus.permanentlyDenied) {
      emit(const StoragePermissionPermanentlyDenied(
          storagePermissionStatus: PermissionStatus.permanentlyDenied));
      await openAppSettings();
    } else {
      emit(const StoragePermissionGranted(
          storagePermissionStatus: PermissionStatus.granted));
    }
  }
}
