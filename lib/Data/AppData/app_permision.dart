import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  ///MEDIA_LOCATION
  static Future<bool> hasAccessMediaPermission({Function()? onSuccess}) async {
    //ask for permission
    await Permission.accessMediaLocation.request();
    var status = await Permission.accessMediaLocation.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.accessMediaLocation.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }
  static Future<bool> hasAccessNotificationPermission({Function()? onSuccess}) async {
    //ask for permission
    await Permission.notification.request();
    var status = await Permission.notification.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.accessMediaLocation.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }

  ///Camera
  static Future<bool> hasAccessCameraPermission({Function()? onSuccess}) async {
    //ask for permission
    await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.camera.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }

  ///Camera
  static Future<bool> hasWritePermission({Function()? onSuccess}) async {
    //ask for permission
    await Permission.manageExternalStorage.request();
    var status = await Permission.manageExternalStorage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied   before but not permanently.
      return false;
    }

// You can can also directly ask the permission about its status.
    if (await Permission.storage.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      return false;
    }
    if (status.isGranted) {
//here you add the code to store the file
      onSuccess!();
      return true;
    }
    return false;
  }
}
