import 'dart:io';
import 'dart:typed_data';

import 'package:hbk/Data/AppData/app_permision.dart';
import 'package:path_provider/path_provider.dart';

class GeneratePDF {
  // static final pdf = Document();


  static Future<File?> hbkInvoice(Uint8List data) async {
    File? file;
    bool check= await AppPermissions.hasWritePermission(onSuccess: () async {


      // print()
      //file=temp;
      //print("filee2 ${temp!.path}");


      // await FileDownloader.download(file.uri.path);
    });
    //  print("nooo ${file?.absolute}");

    if(check==true)
    {
      Directory? tempDir = await getExternalStorageDirectory();

      File? tempFile = await File(
          '${tempDir!.parent.parent.parent.parent.path}/Documents/${DateTime.now().year}_${DateTime.now().month}${DateTime.now().millisecond}_${DateTime.now().month}${DateTime.now().millisecond}.pdf')
          .create(recursive: false);
      //print("filee ${file!.path}");

      file = await tempFile.writeAsBytes(data);

      //await file.writeAsBytes(data);


      return file;
    }
    else
    {
      return null;
    }


  }

  ///PDF UI for coach side play Attendance
  static playerInvoice() {}
}