import 'dart:async';
import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

///This [SendMessagesToStudentsStreamDataLayer] is responsible to send messages
class SendMessagesToStudentsStreamDataLayer {
  Future<int> sendMessagesToUser(String message,
      [List<dynamic>? attachMends]) async {
    // Get current time for the timestamp
    DateTime now = DateTime.now();

    //Format the time stamp in this for : dd/MM/YY h.m
    String formatTime = DateFormat('d MMM y hh.mm a').format(now);

    Map<String, dynamic> newMessage = {};

    // Create a map with 'message','timestamp' and 'likes' keys
    newMessage = {
      'message': message,
      'timestamp': formatTime, // Convert DateTime to String for storage
      'likes': 0,
      'attached_files': attachMends
    };

    // First add this messages to a list to manage all chats
    var chat = await testDatabase.get("chatList", defaultValue: []);

    // Convert the chat to a list
    var chatList = List.of(chat);

    // Add the new message to the chat list
    chatList.add(newMessage);

    try {
      // Add the updated chatList to the database under the key "chatList"
      await testDatabase.put("chatList", chatList);
      return 0;
    } catch (_) {
      return 1;
    }
  }
}

///This [HiveMessageStreamBox] is responsible to Stream the Database
class HiveMessageStreamBox {
  var box = Hive.box("test_db");
  StreamController<List> chatController = StreamController<List>();

  void setChatStream() {
    var chatList = box.get("chatList", defaultValue: []);
    chatController.add(chatList);

    box.watch(key: "chatList").listen((event) {
      chatController.add(event.value);
    });
  }
}
