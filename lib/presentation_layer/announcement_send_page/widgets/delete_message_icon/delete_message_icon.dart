import 'package:class_alert/bloc_layer/delete_messages/delete_messages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteMessageTextIcon extends StatelessWidget {

  final int index;
  const DeleteMessageTextIcon({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    final removeMessage = BlocProvider.of<DeleteMessagesCubit>(context);

    void closeAlertBox(){
      Navigator.pop(context);
    }

    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Delete Announcement?"),
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.black),
                    content: SingleChildScrollView(
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () async{
                                ///Delete that message using it's index
                                await removeMessage.deleteTheMessage(index);
                                closeAlertBox();
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Discard"))
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: const Text("T"),
        ),
      ),
    );
  }
}
