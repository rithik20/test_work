import 'package:class_alert/presentation_layer/create_announcement_page/widgets/announcement_sessions.dart';
import 'package:class_alert/presentation_layer/create_announcement_page/widgets/create_announcement_button.dart';
import 'package:flutter/material.dart';

class CreateAnnouncementButtonPage extends StatelessWidget {
  const CreateAnnouncementButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
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
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: const CreateAnnouncementButton()),
    );
  }
}
