import 'dart:io';
import 'package:class_alert/bloc_layer/pick_files_from_device/pick_files_from_device_cubit.dart';
import 'package:class_alert/bloc_layer/pick_files_from_device/picked_file_type_check/picked_file_type_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickedItemName extends StatelessWidget {
  const PickedItemName({super.key});

  @override
  Widget build(BuildContext context) {

    //for deleting the Messages from the Messages list
    final deleteItem = BlocProvider.of<PickFilesFromDeviceCubit>(context);

    final fileTypeRemove = BlocProvider.of<PickedFileTypeCheckCubit>(context);

    return Material(
      color: Colors.transparent,
      child: BlocBuilder<PickFilesFromDeviceCubit, PickFilesFromDeviceState>(
        key: const Key("Picked File Item Name Bloc"),
        builder: (context, state) {
          if (state.filePath.isNotEmpty) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                    state.filePath.split(Platform.pathSeparator).last,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      ///This will remove the Picked Item
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Remove Selected Item?"),
                              titleTextStyle: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                  color: Colors.black),
                              content: SingleChildScrollView(
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          deleteItem.removePickedItem();
                                          fileTypeRemove.resetFileType();
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Confirm",
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
                    icon: const Icon(Icons.delete))
              ],
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}
