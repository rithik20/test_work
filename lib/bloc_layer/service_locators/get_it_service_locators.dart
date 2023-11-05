import 'package:class_alert/bloc_layer/flutter_widget_controllers/widget_controllers.dart';
import 'package:class_alert/data_layer/file_pick_from_device/file_pick_services.dart';
import 'package:class_alert/data_layer/local_database/database_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocators() {
  filePickFromDeviceService();
  databaseServices();
  widgetControllers();
}
