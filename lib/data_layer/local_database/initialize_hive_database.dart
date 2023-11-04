import 'package:hive/hive.dart';

late Box<dynamic> testDatabase;

class InitializeHiveBox{

  Future<Box> initializeHiveDatabase() async{
    return testDatabase = await Hive.openBox("test_db");
  }
}