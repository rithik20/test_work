import 'package:class_alert/bloc_layer/send_messages_to_students/received_messages_stream/received_messages_stream_bloc.dart';
import 'package:class_alert/presentation_layer/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///This [CreateAnnouncementButton] is for Creating Announcements for Students
class CreateAnnouncementButton extends StatelessWidget {
  const CreateAnnouncementButton({super.key});

  @override
  Widget build(BuildContext context) {

    final receivedMessageBloc = BlocProvider.of<ReceivedMessagesStreamBloc>(context);

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
            onPressed: (){
              receivedMessageBloc.add(ReceivedMessage());
              ///when press this button navigate to the Announcements page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HomePage()));
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
