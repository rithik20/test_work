import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  serviceLocators();

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
    return '.';
  });

  await Hive.initFlutter();

  final InitializeHiveBox initializeHiveBox = InitializeHiveBox();

  testDatabase = await initializeHiveBox.initializeHiveDatabase();

  test("Send Messages To Student Test", () async {
    await testDatabase.clear();

    var database = await testDatabase.get("chatList", defaultValue: []);

    expect(database, []); //passed

    var databaseTest = await testDatabase.get("chatList", defaultValue: []);

    expect(databaseTest, ["Hello"]); //passed
  });
}
