import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/file_pick_from_device/pick_file_from_device.dart';

void filePickFromDeviceService(){
  getIt.registerSingleton(PickFilesFromDeviceDataClass());
}