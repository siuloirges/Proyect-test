import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LoadPictureProvider extends ChangeNotifier {

  PickedFile  _file; 

  File  get getFile => _file!=null? File(_file.path):null;
  set setFile ( PickedFile file ) => _file = file;

}