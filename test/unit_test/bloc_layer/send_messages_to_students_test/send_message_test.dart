import 'package:class_alert/bloc_layer/send_messages_to_students/send_messages_stream/send_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
    return '.';
  });

  await Hive.initFlutter();

  final InitializeHiveBox initializeHiveBox = InitializeHiveBox();

  testDatabase = await initializeHiveBox.initializeHiveDatabase();

  serviceLocators();

  late SendMessagesStreamBloc sendMessagesStreamBloc;

  setUp(() {
    sendMessagesStreamBloc = SendMessagesStreamBloc();
  });

  test("Send Messages To Student Test", () async {

    await testDatabase.clear();

    expect(sendMessagesStreamBloc.state, SendMessagesStreamInitial());//passed

    var database = await testDatabase.get("chatList", defaultValue: []);

    expect(database, []); //passed

    sendMessagesStreamBloc.add(SendMessage(message: "Hello", attachment: const []));

    await Future.delayed(const Duration(seconds: 1));

    expect(sendMessagesStreamBloc.state, MessageSendSuccess());//passed

    var databaseTest = await testDatabase.get("chatList", defaultValue: []);

    expect(databaseTest, [{
      "message": "Hello",
      "timestamp": "5 Nov 2023 08.21 PM",
      "likes": 0,
      "attached_files": []
    }]); //passed
  });
}
