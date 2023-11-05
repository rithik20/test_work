import 'package:class_alert/bloc_layer/delete_messages/delete_messages_cubit.dart';
import 'package:class_alert/bloc_layer/permission_handler_bloc/storage_permission_logic/storage_permission_cubit.dart';
import 'package:class_alert/bloc_layer/pick_files_from_device/pick_files_from_device_cubit.dart';
import 'package:class_alert/bloc_layer/send_messages_to_students/received_messages_stream/received_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/send_messages_to_students/send_messages_stream/send_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';
import 'package:class_alert/data_layer/local_database/send_messages/send_messages_to_students.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/announcement_send_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  serviceLocators();

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
    return '.';
  });

  ///Initialize Hive database
  await Hive.initFlutter();

  ///For initializing the testDatabase box
  final InitializeHiveBox initializeHiveBox = InitializeHiveBox();

  ///open [testDatabase] box using the [InitializeHiveBox] class's object
  testDatabase = await initializeHiveBox.initializeHiveDatabase();

  getIt<HiveMessageStreamBox>().setChatStream();

  testWidgets("Announcement Send Screen Test", (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StoragePermissionStatusCubit()),
        BlocProvider(create: (context) => PickFilesFromDeviceCubit()),
        BlocProvider(create: (context) => SendMessagesStreamBloc()),
        BlocProvider(create: (context) => ReceivedMessagesStreamBloc()),
        BlocProvider(create: (context) => DeleteMessagesCubit()),
      ],
      child: const MaterialApp(
        home: AnnouncementMessageSendScreen(),
      ),
    ));
  });
}
