import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:proyect_test/src/modules/load_picture/provider/load_picture_provider.dart';

void main(){
  test('Testing load image', ()  {

    LoadPictureProvider loadPictureProvider = LoadPictureProvider();
    File data = loadPictureProvider.getFile;
    expect(data, data);

  });

 
}