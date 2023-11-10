import 'dart:io';
import 'package:class_alert/bloc_layer/pick_files_from_device/pick_files_from_device_cubit.dart';
import 'package:class_alert/bloc_layer/pick_files_from_device/picked_file_type_check/picked_file_type_check_cubit.dart';
import 'package:class_alert/bloc_layer/send_messages_to_students/send_messages_stream/send_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/bloc_layer/flutter_widget_controllers/widget_controllers.dart';
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

    final sendAttach = BlocProvider.of<PickedFileTypeCheckCubit>(context);

    final selectedFile = BlocProvider.of<PickFilesFromDeviceCubit>(context);

    return Container(
        decoration:
            const BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
              onPressed: () async {
                ///When pressing this Button the User can send the Message
                ///firstly check if there is any value presented

                if (selectedFile.state.filePath.isEmpty) {
                  sendMessage.add(SendMessage(
                      message: textControllers.sendMessage.value.text,
                      attachment: const []));
                } else {
                  sendMessage.add(SendMessage(
                      message: textControllers.sendMessage.value.text,
                      attachment: [
                        {
                          "fileName": selectedFile.state.filePath
                              .split(Platform.pathSeparator)
                              .last,
                          "filePath": selectedFile.state.filePath,
                          "fileType": sendAttach.state.selectedFileType,
                        }
                      ]));
                }

                ///also clear the Values after the Message Send
                textControllers.sendMessage.clear();
                selectedFile.removePickedItem();
                sendAttach.resetFileType();
              },
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              )),
        ));
  }
}
