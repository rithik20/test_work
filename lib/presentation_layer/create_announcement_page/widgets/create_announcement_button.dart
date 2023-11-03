import 'package:class_alert/presentation_layer/announcement_send_page/announcement_send_screen.dart';
import 'package:flutter/material.dart';

///This [CreateAnnouncementButton] is for Creating Announcements for Students
class CreateAnnouncementButton extends StatelessWidget {
  const CreateAnnouncementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("You can Create Announcements to your Classes"),
          MaterialButton(
            textColor: Colors.white,
            color: Colors.purple,
            height: 30.0,
            elevation: 5.0,
            onPressed: () {
              ///when press this button navigate to the Announcements page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AnnouncementMessageSendScreen()));
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: const Text("Create Announcement"),
          ),
        ],
      ),
    );
  }
}
