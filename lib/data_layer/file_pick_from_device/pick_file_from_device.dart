import 'package:file_picker/file_picker.dart';

class PickFilesFromDeviceDataClass {
  Future<String?> pickFilesFromDevice() async {
    try {
      FilePickerResult? files = await FilePicker.platform.pickFiles();
      return files!.files.first.path;
    } catch (_) {
      return null;
    }
  }
}
