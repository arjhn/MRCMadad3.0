import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ServiceImagePicker{

  String imageName='';

  Future<String> pickImage() async{

    XFile? profileImage= await ImagePicker().pickImage(source: ImageSource.gallery);

    if(profileImage!=null){
      Directory appDir=await getApplicationDocumentsDirectory();
      //String imagePathName='profile_pic'+'.'+path.basename(profileImage.path).split('.').last;
      String imagePathName=path.basename(profileImage.path);
      imageName=imagePathName;
      final savedImage=await File(profileImage.path).copy('${appDir.path}/$imagePathName');
      return '${appDir.path}/$imagePathName';
    }

    else
      return '';
  }


}