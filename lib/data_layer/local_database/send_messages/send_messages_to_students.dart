import 'dart:async';

import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';
import 'package:hive/hive.dart';

class SendMessagesToStudentsDataLayer {
  Future<int> sendMessagesToUser(String message) async {
    ///First add this messages to a list to manage all chats
    var chat = await testDatabase.get("chatList", defaultValue: []);

    ///Step 1: Convert the [chat] to a list
    var chatList = List.of(chat);

    ///Step 2: add the message to the [chatList]
    chatList.add(message);

    ///Step 3: add the [chatList] to the Database key called "chatList"
    try {
      await testDatabase.put("chatList", chatList);
      return 0;
    } catch (_) {
      return 1;
    }
  }
}

class SendMessagesToStudentsStreamDataLayer {
  Future<int> sendMessagesToUser(String message) async {
    ///First add this messages to a list to manage all chats
    var chat = await testDatabase.get("chatList", defaultValue: []);

    ///Step 1: Convert the [chat] to a list
    var chatList = List.of(chat);

    ///Step 2: add the message to the [chatList]
    chatList.add(message);

    ///Step 3: add the [chatList] to the Database key called "chatList"
    try {
      await testDatabase.put("chatList", chatList);
      return 0;
    } catch (_) {
      return 1;
    }
  }
}

class HiveMessageStreamBox {
  var box = Hive.box("test_db");
  StreamController<List> chatController = StreamController<List>.broadcast();

  void setChatStream() {
    var chatList = box.get("chatList", defaultValue: []);
    chatController.add(chatList);

    box.watch(key: "chatList").listen((event) {
      chatController.add(event.value);
    });
  }
}
