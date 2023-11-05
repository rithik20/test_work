import 'package:class_alert/presentation_layer/create_announcement_page/widgets/create_announcement_button.dart';
import 'package:flutter/material.dart';

class CreateAnnouncementButtonPage extends StatelessWidget {
  const CreateAnnouncementButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Announcement",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const CreateAnnouncementButton()),
    );
  }
}
