import 'package:class_alert/bloc_layer/permission_handler_bloc/storage_permission_logic/storage_permission_cubit.dart';
import 'package:class_alert/bloc_layer/pick_files_from_device/pick_files_from_device_cubit.dart';
import 'package:class_alert/bloc_layer/pick_files_from_device/picked_file_type_check/picked_file_type_check_cubit.dart';
import 'package:class_alert/bloc_layer/send_messages_to_students/send_messages_stream/send_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/send_message_button/send_message_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
        return '.';
      });

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
      const MethodChannel('flutter.baseflow.com/permissions/methods'),
          (MethodCall methodCall) async {
        return 1;
      });

  ///initialize the permissionStatus late variable in the
  ///bloc_layer/permission_handler_bloc/storage_permission_logic/storage_permission_cubit.dart
  ///file
  ///
  permissionStatus = await Permission.storage.status;

  ///Initialize Hive database
  await Hive.initFlutter();

  ///For initializing the testDatabase box
  final InitializeHiveBox initializeHiveBox = InitializeHiveBox();

  ///open [testDatabase] box using the [InitializeHiveBox] class's object
  testDatabase = await initializeHiveBox.initializeHiveDatabase();

  serviceLocators();

  testWidgets("Send Message Button Test", (widgetTester) async{

    await widgetTester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SendMessagesStreamBloc()),
          BlocProvider(create: (context) => PickedFileTypeCheckCubit()),
          BlocProvider(create: (context) => PickFilesFromDeviceCubit()),
        ],
        child: const MaterialApp(
          home: SendMessageButton(),
        )));

    expect(find.byType(Container), findsWidgets);//passed
    expect(find.byType(IconButton), findsWidgets);//passed
    expect(find.byIcon(Icons.send), findsOneWidget);//passed
  });
}