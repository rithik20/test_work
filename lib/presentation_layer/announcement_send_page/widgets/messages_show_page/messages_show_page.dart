import 'package:class_alert/bloc_layer/flutter_widget_controllers/widget_controllers.dart';
import 'package:class_alert/bloc_layer/like_messages/like_messages_cubit.dart';
import 'package:class_alert/bloc_layer/send_messages_to_students/received_messages_stream/received_messages_stream_bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/initialize_hive_database.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/delete_message_icon/delete_message_icon.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/message_like_button/message_like_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesShowWidget extends StatelessWidget {
  const MessagesShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scroll = getIt<ScrollControllers>();

    final likeMessage = BlocProvider.of<LikeMessagesCubit>(context);

    ///The Messages List is Rebuild whenever a new message from the
    ///Sender
    ///
    return BlocBuilder<ReceivedMessagesStreamBloc, ReceivedMessagesStreamState>(
        builder: (context, messageList) {
      if (messageList.messageFromOther.isNotEmpty) {
        ///go to the last send message area using ScrollController
        if (scroll.chatScrollController.hasClients) {
          scroll.chatScrollController.animateTo(
            scroll.chatScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
        return ListView.builder(
            controller: scroll.chatScrollController,
            itemCount: messageList.messageFromOther.length,
            itemBuilder: (context, index) {
              var attachMends = List.of(
                  messageList.messageFromOther[index]['attached_files']);
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onLongPress: () async {
                            //get the index Number of the Message
                            int itemIndex = index;

                            ///also call the countAdjuster() method
                            ///in the [LikeMessagesCubit] class to
                            ///check if the selected Index's count is correct
                            ///or not!
                            ///
                            int selectedItemCurrentCount = messageList
                                .messageFromOther[itemIndex]['likes'];
                            likeMessage.countAdjuster(
                                itemIndex, selectedItemCurrentCount);

                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(80.0),
                                    child: AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  likeMessage.likeTheMessage(
                                                      itemIndex);

                                                  ///change the 'likes' key value
                                                  ///in the Database to add new Value
                                                  messageList.messageFromOther[
                                                              itemIndex]
                                                          ['likes'] =
                                                      likeMessage.count;

                                                  ///update the database
                                                  testDatabase.put(
                                                      "chatList",
                                                      messageList
                                                          .messageFromOther);

                                                  ///if the Message is Liked then close
                                                  ///the Pop up window
                                                  if (likeMessage.state
                                                      is MessageLiked) {
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                icon: const MessageLikeIcon())
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },

                          ///Show the Message and the time that send
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                color: Colors.deepPurple[50]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "${messageList.messageFromOther[index]['message']}",
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),

                                if (attachMends.isNotEmpty) ...[
                                  Column(
                                    children: [
                                      for (int i = 0;
                                          i < attachMends.length;
                                          i++)
                                        if (attachMends[i]['fileType'] ==
                                            'application/pdf')

                                          ///if the Application is pdf
                                          ///then show a pdf image
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(10.0),
                                                      color: Colors.white),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        "assets/message_send_page/pdf-1.png",
                                                        width: 50.0,
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                        "${attachMends[i]['fileName']}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[500]),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              ///A download Button to download the Attachment
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    CupertinoIcons
                                                        .arrow_down_circle_fill,
                                                    color: Colors.grey[400],
                                                  ))
                                            ],
                                          )
                                        else
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(10.0),
                                                      color: Colors.white),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        "assets/notes_page/multimedia-icon-png-3991.png",
                                                        width: 40.0,
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                        "${attachMends[i]['fileName']}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[500]),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              ///A download Button to download the Attachment
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    CupertinoIcons
                                                        .arrow_down_circle_fill,
                                                    color: Colors.grey[400],
                                                  ))
                                            ],
                                          )
                                    ],
                                  ),
                                ],
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${messageList.messageFromOther[index]['timestamp']}",
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ],
                                ),

                                ///This will Visible only if the
                                ///User is Liked the Message
                                BlocBuilder<LikeMessagesCubit,
                                    LikeMessagesState>(
                                  builder: (context, likeState) {
                                    ///Show the like count only if the
                                    ///'likes' key's value is not zero of
                                    ///each messages
                                    if (messageList.messageFromOther[index]
                                            ['likes'] !=
                                        0) {
                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${messageList.messageFromOther[index]['likes']}",
                                            style: const TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          const Icon(
                                            CupertinoIcons.hand_thumbsup,
                                            size: 15.0,
                                            color: Colors.blueAccent,
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          const Text(
                                            "Like",
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      );
                                    }
                                    return const Visibility(
                                      visible: false,
                                      child: Text(""),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      DeleteMessageTextIcon(index: index),
                    ],
                  ),
                ),
              );
            });
      } else {
        return const Center(child: Text("No Messages To Show"));
      }
    });
  }
}
