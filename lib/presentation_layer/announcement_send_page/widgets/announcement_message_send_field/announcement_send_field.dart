import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/bloc_layer/flutter_widget_controllers/widget_controllers.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/file_pick_attach_button/pick_files_attach_button.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/picked_item_name_show/picked_item_name_show.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/announcement_message_send_field/send_message_button/send_message_button.dart';
import 'package:flutter/material.dart';

class SendAnnouncementToStudents extends StatelessWidget {
  const SendAnnouncementToStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft:
            Radius.circular(10.0))
      ),
      child: Material(
        color: Colors.transparent,
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
                SizedBox(
                  width: 5.0,
                ),
                Flexible(child: PickedItemName()),
                SizedBox(
                  width: 5.0,
                ),
                SendMessageButton(),
              ],
            ),
          ],
        ),
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
