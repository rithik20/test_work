import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/delete_messages/delete_messages.dart';
import 'package:class_alert/data_layer/local_database/send_messages/send_messages_to_students.dart';

void databaseServices(){
  getIt.registerSingleton(SendMessagesToStudentsStreamDataLayer());
  getIt.registerSingleton(DeleteMessageDatabaseDataLayer());
  getIt.registerSingleton(HiveMessageStreamBox());
}