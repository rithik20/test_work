import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/bloc_layer/text_editing_controllers/text_editing_controllers.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/file_pick_attach_button/pick_files_attach_button.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/send_message_button/send_message_button.dart';
import 'package:flutter/material.dart';

class SendAnnouncementToStudents extends StatelessWidget {
  const SendAnnouncementToStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height / 5,
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              controller: getIt<TextEditingControllers>().sendMessage,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Enter Your Announcement Here",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 12.0, right: 12.0),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///This widget is for picking the Files from the device
              PickFilesAttachButton(),
              SendMessageButton(),
            ],
          ),
        ],
      ),
    );
  }
}

// class Button2 extends StatelessWidget {
//   const Button2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: TextFormField(
//             maxLines: null,
//             decoration: const InputDecoration(
//               hintText: "Enter Your Announcement Here",
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(left: 12.0, right: 12.0),
//             ),
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(5.0),
//           child: Row(
//             children: [
//               IconButton(onPressed: (){}, icon: const Icon(Icons.attach_file)),
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.purple,
//                   shape: BoxShape.circle
//                 ),
//                   child: IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: Colors.white,))),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
