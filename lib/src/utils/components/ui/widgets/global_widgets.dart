import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';

floadMessage(
    {String titulo,
    String mensaje,
    Duration duration,
    ToastPosition toastPosition,
    double bigHeight,
    int maxLine,
    double borderRadius}) {
  showToastWidget(
    FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        child: Container(
          height: bigHeight ?? 50,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.4),
              borderRadius: BorderRadius.circular(borderRadius ?? 100)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      mensaje ?? "",
                      maxLines: bigHeight == null ? 1 : maxLine ?? 1,

                      //  overflow: TextOverflow.clip,
                      style: const TextStyle(color: Colors.yellow),

                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    position: toastPosition ?? ToastPosition.bottom,
    duration: duration ?? const Duration(seconds: 3),
  );
}

alerta(BuildContext context,
    {bool code = true,
    String titulo,
    dynamic contenido,
    Widget acciones,
    bool dismissible,
    bool done,
    Widget onpress,
    Color colorTitulo,
    Color colorContenido,
    bool weight = false}) {
  return showDialog(
      barrierDismissible: dismissible ?? true,
      barrierColor: Colors.black54,
      context: context,
      builder: (context) {
        return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: const Color.fromRGBO(246, 245, 250, 1),
              title: Container(
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      titulo ?? 'Alerta',
                      style: TextStyle(color: colorTitulo ?? Colors.grey),
                    )),
                  )),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: SizedBox(
                          width: double.infinity,
                          // height: size.width>450?200: size.height * 0.22,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                code == true
                                    ? contenido
                                    : Text('$contenido',
                                        style: TextStyle(
                                            color:
                                                colorContenido ?? Colors.grey,
                                            fontWeight: weight == false
                                                ? FontWeight.w400
                                                : FontWeight.bold))
                              ],
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: done == true
                                ? Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              child: const Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.white),
                                              width: 50,
                                              height: 50,
                                              decoration: ShapeDecoration(
                                                  color: Colors.grey,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                            )),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: onpress),
                                    ],
                                  )
                                : done == false
                                    ? Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  child: const Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.white),
                                                  width: 50,
                                                  height: 50,
                                                  decoration: ShapeDecoration(
                                                      color: Colors.grey,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                )),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [acciones ?? Container()],
                                      ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      });
}

load(BuildContext context, {bool colorSuave = false}) {
  return showDialog(
      // barrierColor:
      // useSafeArea: tue,
      barrierColor: colorSuave == false
          ? const Color.fromRGBO(64, 62, 65, 0.5)
          : Colors.transparent,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 75,
                child: (CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                      child: Stack(children: const [
                    Center(
                      child: Icon(Icons.app_registration_rounded,color: primaryColor,),
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                        backgroundColor: primaryColor,
                      ),
                    ),
                  ])),
                )),
              ),
            ),
          ),
        );
      });
}
