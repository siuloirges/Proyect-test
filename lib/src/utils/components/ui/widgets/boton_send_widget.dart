import 'package:flutter/material.dart';


class BotomSendWidget extends StatefulWidget {
  
  Function onTap;
  String textButtom;
  Color colorButtom;
  Color colorShadow;
  BotomSendWidget({Key key, this.onTap, this.textButtom, this.colorButtom, this.colorShadow}) : super(key: key);

  @override
  State<BotomSendWidget> createState() => _BotomSendWidgetState(onTap: onTap, textButtom: textButtom,colorButtom: colorButtom,colorShadow: colorShadow );
  
}

class _BotomSendWidgetState extends State<BotomSendWidget> {

  Function onTap;
  String textButtom;
  Color colorButtom;
  Color colorShadow;
  _BotomSendWidgetState({this.onTap,this.textButtom,this.colorButtom,this.colorShadow});

  Size size;
  Offset offset = const Offset(0, 3);
  double espacio = 0;
  double alfa = 0.0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
    height: 75,
    width: size.width * 0.9,
    padding: const EdgeInsets.only(
      top: 5,
      left: 5,
      bottom: 5,
    ),
    
    margin: const EdgeInsets.only(bottom: 16),
    child: GestureDetector(
      onTap: (){
       onTap()??(){};
      },

      onTapDown: (v){
        offset =  const Offset(0, 0);
        espacio = 3;
        setState(() {
          
        });

      },

      onTapCancel: (){
        espacio = 0;
        offset =  const Offset(0, 3);
        setState(() {
          
        });
      },

      onTapUp:(v){
        espacio = 0;
        offset =  const Offset(0, 3);
        setState(() {
          
        });
      },
      child: Column(
        children: [
          SizedBox(height: espacio),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: colorButtom?? const Color.fromRGBO(31, 199, 212,1),
              borderRadius: BorderRadius.circular(16),
               boxShadow: [
                      BoxShadow(
                        color:  onTap != null ? colorShadow?? const Color.fromRGBO(25, 125, 145, 1) : Colors.black54,
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: offset,
                      )
                    ]
            ),


            child: Container(
              
              decoration: BoxDecoration(
                color: onTap != null ? Color.fromRGBO(255, 255, 255, alfa):Colors.grey,
                borderRadius: BorderRadius.circular(16),
                
              ),

              child: Center(child: Text(textButtom??"",style:const  TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),)),
          ),
        ],
      ),
    )

  );
  }


}