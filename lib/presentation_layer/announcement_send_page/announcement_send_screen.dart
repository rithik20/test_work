import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/announcement_send_field.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/messages_show_page/messages_show_page.dart';
import 'package:flutter/material.dart';

class AnnouncementMessageSendScreen extends StatelessWidget {
  const AnnouncementMessageSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const MessagesShowWidget()),
      bottomNavigationBar: const SendAnnouncementToStudents(),
    );
  }
}
