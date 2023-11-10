import 'package:class_alert/bloc_layer/send_messages_to_students/received_messages_stream/received_messages_stream_bloc.dart';
import 'package:class_alert/presentation_layer/attachment_view_page/image_view_page/image_view_page.dart';
import 'package:class_alert/presentation_layer/attachment_view_page/pdf_view_page/pdf_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StudentNotesPage extends StatelessWidget {
  const StudentNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<ReceivedMessagesStreamBloc,
            ReceivedMessagesStreamState>(
          key: const Key("Notes Page ReceivedMessagesStreamBloc"),
            builder: (context, attachList) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/notes_page/3902978-200.png",
                            width: 25.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                Icon(
                                  CupertinoIcons.chevron_down,
                                  color: Colors.grey[500],
                                  size: 15.0,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                Icon(
                                  CupertinoIcons.chevron_down,
                                  color: Colors.grey[500],
                                  size: 15.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2.0,
                color: Colors.purple,
              ),

              ///Showing added pdf files and date
              Expanded(
                child: ListView.builder(
                    itemCount: attachList.messageFromOther.length,
                    itemBuilder: (context, index) {
                      // Accessing the attached_files map for the current message
                      List<dynamic> attachedFiles =
                          attachList.messageFromOther[index]['attached_files'];
                      String timeStamp =
                          attachList.messageFromOther[index]['timestamp'];

                      if (attachedFiles.isNotEmpty) {
                        var fileName = attachedFiles[0]['fileName'];
                        var fileType = attachedFiles[0]['fileType'];
                        var filePath = attachedFiles[0]['filePath'];

                        DateFormat inputFormat = DateFormat("d MMM y hh.mm a");

                        // Parse the string to DateTime
                        DateTime dateTime = inputFormat.parse(timeStamp);

                        // Format the DateTime to show only the date
                        DateFormat outputFormat = DateFormat
                            .yMMMd(); // Change the output format as needed

                        String date = outputFormat.format(dateTime);

                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (fileType == "application/pdf")
                                          Image.asset(
                                            "assets/message_send_page/pdf.png",
                                            width: 25.0,
                                          )
                                        else
                                          Image.asset(
                                            "assets/notes_page/multimedia-icon-png-3991.png",
                                            width: 30.0,
                                          ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Flexible(

                                            ///when tapping the name then show the
                                            ///pdf
                                            child: InkWell(
                                          onTap: () {
                                            if (fileType == "application/pdf") {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PDFViewPage(
                                                              filePath:
                                                                  filePath)));
                                            }

                                            ///otherwise show Image file
                                            else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ImageViewPage(
                                                              imagePath:
                                                                  filePath)));
                                            }
                                          },
                                          child: Text(
                                            "$fileName",
                                            maxLines: 5,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(date),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                ],
                              ),
                            ),
                            const Divider()
                          ],
                        );
                      } else {
                        ///Ignore the Null values
                        return Container();
                      }
                    }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
