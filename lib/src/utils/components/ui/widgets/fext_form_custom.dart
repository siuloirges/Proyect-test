import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  
  TextEditingController textController;
  FocusNode focusNode;
  String hintext = "";
  String lavelText = "";
  Function(String) onChanged;
  Function(String) validate;
  Function(String) onFieldSubmitted;
  BoxDecoration decoration;
  String initialValue = '';
  bool readOnly = false;
  bool obscureText = false;
  TextInputType keyboardType;
  Widget suffixIcon;
  
  TextFormCustom(
    {
      
      this.textController,
      this.focusNode,
      this.hintext,
      this.lavelText,
      this.onChanged,
      this.decoration,
      this.initialValue,
      this.readOnly,
      this.obscureText,
      this.keyboardType,
      this.suffixIcon,
      this.validate,
      this.onFieldSubmitted,

    }
  );




  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: decoration,
      child: Column(
        children: [


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
               color: const Color.fromRGBO(238, 234, 244, 1),
               boxShadow: const [BoxShadow(
                 color: Color.fromRGBO(214, 210, 219,1),
                 blurRadius: 0,
                 spreadRadius: 0,
                 offset:  Offset(0,-1),
                 
               )]
                
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: TextFormField(
                  
                  validator: validate,
                  keyboardType: keyboardType,
                  obscureText: obscureText??false,
                  readOnly: readOnly??false,
                  focusNode: focusNode,
                  controller: textController,
                  onChanged: onChanged,
                  onFieldSubmitted: onFieldSubmitted,
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    border: InputBorder.none,
                    hintText: hintext,
                    labelText: lavelText,
                  ),
                  // textAlign: TextAlign.,
                  initialValue: initialValue,
                  
                  

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}