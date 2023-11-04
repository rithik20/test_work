import 'package:class_alert/bloc_layer/send_messages_to_students/received_messages_stream/received_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/send_messages/send_messages_to_students.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/announcement_send_field.dart';
import 'package:class_alert/presentation_layer/create_announcement_page/widgets/announcement_sessions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementMessageSendScreen extends StatefulWidget {
  const AnnouncementMessageSendScreen({super.key});

  @override
  State<AnnouncementMessageSendScreen> createState() =>
      _AnnouncementMessageSendScreenState();
}

class _AnnouncementMessageSendScreenState
    extends State<AnnouncementMessageSendScreen> {
  @override
  void initState() {
    super.initState();
    getIt<HiveMessageStreamBox>().setChatStream();
  }

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
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              BlocBuilder<ReceivedMessagesStreamBloc, ReceivedMessagesStreamState>(
                  builder: (context, state){
                if(state.messageFromOther.isNotEmpty){
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.messageFromOther.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text("${state.messageFromOther[index]}"),);
                        }),
                  );
                }else{
                  return const Expanded(child: Text("No Messages To Show"));
                }
              }),
              const SendAnnouncementToStudents()
            ],
          )),
    );
  }
}
