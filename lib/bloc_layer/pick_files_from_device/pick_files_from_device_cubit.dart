import 'package:bloc/bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/file_pick_from_device/pick_file_from_device.dart';
import 'package:flutter/material.dart';

part 'pick_files_from_device_state.dart';

class PickFilesFromDeviceCubit extends Cubit<PickFilesFromDeviceState> {
  PickFilesFromDeviceCubit()
      : super(const PickFilesFromDeviceInitial(filePath: ""));

  ///Need the [PickFilesFromDeviceDataClass] Data Provider for picking Files
  ///From Device
  Future<void> pickFilesFromDevice() async {
    try {
      String? filePath =
          await getIt<PickFilesFromDeviceDataClass>().pickFilesFromDevice();

      if(filePath != null){
        emit(FilePickedFromDeviceSuccessfully(filePath: filePath));
      }else{
        emit(const FilePickingFromDeviceError(filePath: null));
      }
    } catch (_) {
      emit(const FilePickingFromDeviceError(filePath: null));
    }
  }
}
