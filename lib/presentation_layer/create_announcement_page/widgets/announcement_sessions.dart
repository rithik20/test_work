import 'package:flutter/material.dart';

///This [AnnouncementSessions] widget is for navigating between two sessions
class AnnouncementSessions extends StatelessWidget {
  const AnnouncementSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
        child: Row(
      children: [
        Text("Announcement",
            style:
                TextStyle(color: Colors.purple, fontWeight: FontWeight.w500)),
        SizedBox(
          width: 20.0,
        ),
        Text("Notes",
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500))
      ],
    ));
  }
}
