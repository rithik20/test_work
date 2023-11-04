import 'package:class_alert/bloc_layer/send_messages_to_students/send_messages_stream/send_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/bloc_layer/text_editing_controllers/text_editing_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    //for working with TextEditingControllers
    final textControllers = getIt<TextEditingControllers>();

    //for sending messages
    final sendMessage = BlocProvider.of<SendMessagesStreamBloc>(context);

    return Container(
        decoration:
            const BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
        child: IconButton(
            onPressed: () async {
              ///When pressing this Button the User can send the Message
              ///firstly check if there is any value presented
              if (textControllers.sendMessage.value.text.isNotEmpty) {
                sendMessage.add(SendMessage(
                    message: textControllers.sendMessage.value.text));
              }

              ///also clear the Value after the Message Send
              textControllers.sendMessage.clear();
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            )));
  }
}
