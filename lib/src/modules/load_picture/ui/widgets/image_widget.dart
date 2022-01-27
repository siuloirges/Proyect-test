import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/global_widgets.dart';
import 'package:proyect_test/src/modules/load_picture/provider/load_picture_provider.dart';
 

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  // File perfilImage;
  Size size;
  LoadPictureProvider loadPicture;
  @override
  Widget build(BuildContext context) {

    loadPicture = Provider.of<LoadPictureProvider>(context);

    size = MediaQuery.of(context).size;
    return  Column(
      children: [
        const SizedBox(height: 50,),
        crearImagen(context),
      ],
    );
  }

      Widget crearImagen(BuildContext context) {
  
    return Stack(
      children: [
        Center(
          child: Container(
              decoration: BoxDecoration(
                boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(1,2),blurRadius: 1)],
                  color: Colors.white, borderRadius: BorderRadius.circular(100)),
              width: 165,
              height: 165,
              child: loadPicture.getFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                          fit: BoxFit.cover, image: FileImage(loadPicture.getFile)),
                    )
                  : const Center(child: Text("without picture"))),
        ),
        loadPicture.getFile != null
            ? Center(
                child: IconButton(
                    alignment: Alignment.center,
                    iconSize: 1,
                    icon: IconButton(
                      icon: const Icon(
                        Icons.highlight_remove_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          loadPicture.setFile = null;
                        });
                      },
                    ),
                    onPressed: null),
              )
            : Container(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             const SizedBox(
                height: 140,
              ),
               ElevatedButton(
                 style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),) ,
                      elevation:  MaterialStateProperty.all(1),
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                onPressed: () {
                  onpressaddImage(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const  [
                    Center(
                      child: SizedBox(
                        width: 100,
                        child: Center(
                            child: Text('Upload',
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 30),
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  
  void onpressaddImage(BuildContext context) {
    alerta(context,
          titulo: "Select",
          code:true,
          contenido: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),) ,
                      elevation:  MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.center_focus_strong,
                          color: Colors.white,
                          size: size.width * 0.05,
                        ),
                        Text(
                          'Take',
                          style: TextStyle(
                              fontSize: size.width * 0.038, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      cargarImageCamera();
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: size.height * 0.025,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),) ,
                      elevation:  MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: size.width * 0.040,
                        ),
                       const  Text(
                          'Galery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      cargarImageGalery();
                      Navigator.pop(context);
                    }),
              ],
            ),);
   
  }

  
  Future cargarImageGalery() async {
     PickedFile tempImage = await ImagePicker.platform.pickImage(
        maxHeight: 480, maxWidth: 640, source: ImageSource.gallery
    );
    setState(() {
      loadPicture.setFile = tempImage;
    });
  }

  Future cargarImageCamera() async {
    PickedFile tempImageCamera = await ImagePicker.platform.pickImage(
        maxHeight: 480, maxWidth: 640, source: ImageSource.camera
    );

    setState(() {
      loadPicture.setFile = tempImageCamera;
    });
  }
}