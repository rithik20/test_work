import 'package:class_alert/bloc_layer/permission_handler_bloc/storage_permission_logic/storage_permission_cubit.dart';
import 'package:class_alert/bloc_layer/pick_files_from_device/pick_files_from_device_cubit.dart';
import 'package:class_alert/bloc_layer/pick_files_from_device/picked_file_type_check/picked_file_type_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class PickFilesAttachButton extends StatelessWidget {
  const PickFilesAttachButton({super.key});

  @override
  Widget build(BuildContext context) {
    //for picking files from device
    final pickFiles = BlocProvider.of<PickFilesFromDeviceCubit>(context);

    //for asking storage permission
    final storagePermissionCheck =
        BlocProvider.of<StoragePermissionStatusCubit>(context);

    final fileTypeCheck = BlocProvider.of<PickedFileTypeCheckCubit>(context);

    return Material(
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.all(Radius.circular(5.0))),
          child: Row(
            children: [
              IconButton(
                  onPressed: () async {
                    ///Firstly request the Storage Permission, then after check the status
                    ///of permission
                    if (storagePermissionCheck.state.storagePermissionStatus !=
                        PermissionStatus.granted) {
                      await storagePermissionCheck
                          .checkStoragePermissionStatus();
                    }

                    ///if the Storage Permission is Granted then pick files from the
                    ///device
                    else if (storagePermissionCheck
                            .state.storagePermissionStatus ==
                        PermissionStatus.granted) {
                      await pickFiles.pickFilesFromDevice();

                      fileTypeCheck.checkThisFileType(pickFiles.state.filePath);
                    }
                  },
                  icon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.attach_file), Flexible(child: Text("Attach File"))],
                  )),
            ],
          )),
    );
  }
}
