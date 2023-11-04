import 'package:class_alert/bloc_layer/text_editing_controllers/text_editing_controllers.dart';
import 'package:class_alert/data_layer/file_pick_from_device/file_pick_services.dart';
import 'package:class_alert/data_layer/local_database/database_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocators() {
  filePickFromDeviceService();
  databaseServices();
  textControllers();
}
