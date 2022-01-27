import 'package:flutter/material.dart';
import 'package:proyect_test/src/modules/load_picture/ui/widgets/image_widget.dart';

 

class LoadPicture extends StatefulWidget {
  const LoadPicture({Key key}) : super(key: key);

  @override
  State<LoadPicture> createState() => _LoadPictureState();
}

class _LoadPictureState extends State<LoadPicture> {

  @override
  Widget build(BuildContext context) {

    return const Center(child: ImageWidget(),);
  }


} 