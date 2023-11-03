import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_send_field.dart';
import 'package:class_alert/presentation_layer/create_announcement_page/widgets/announcement_sessions.dart';
import 'package:flutter/material.dart';

class AnnouncementMessageSendScreen extends StatelessWidget {
  const AnnouncementMessageSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      ///Navigate to Previous Widget
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.purple,
                    )),
                const Text(
                  "Announcement",
                  style:
                  TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const AnnouncementSessions(),
          ],
        ),
      ),

      body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ],
          )
      ),

      floatingActionButton: const SendAnnouncementToStudents(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
