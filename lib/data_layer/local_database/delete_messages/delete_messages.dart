import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';

class DeleteMessageDatabaseDataLayer {
  Future<int> deleteThisMessage(int index) async {
    ///Step 1: Get the Message List
    var chat = testDatabase.get("chatList", defaultValue: []);

    ///Step 2: Check if the List is Empty or not
    var chatList = List.of(chat);

    if (chatList.isNotEmpty) {
      ///Step 3: remove that Message
      chatList.removeAt(index);

      ///Step 4: update the Database
      try {
        await testDatabase.put("chatList", chatList);
        return 0;
      } catch (_) {
        return 1;
      }
    } else {
      return 1;
    }
  }
}
