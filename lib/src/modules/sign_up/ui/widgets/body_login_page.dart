// ignore_for_file: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/boton_send_widget.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/fext_form_custom.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/global_widgets.dart';
import 'package:proyect_test/src/modules/load_picture/provider/load_picture_provider.dart';
import 'package:proyect_test/src/utils/providers/validaciones_utils.dart';

class BodyRegisterPage extends StatefulWidget {
  

  const BodyRegisterPage({Key key}) : super(key: key);

  @override
  State<BodyRegisterPage> createState() => _BodyRegisterPageState();
}

class _BodyRegisterPageState extends State<BodyRegisterPage> {

  var formKey = GlobalKey<FormState>();

  FirebaseAuth firebase = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode repeatPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {

    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormCustom(
              focusNode: emailFocus,
              textController: emailController,
              hintext: "example@test.dev",
              lavelText: 'Email',
              onFieldSubmitted: (v){
                passwordFocus.requestFocus();
              },
              validate: (v)=>Validations().validateEmail(v),
            ),
            TextFormCustom(
              obscureText: true,
              focusNode: passwordFocus,
              textController: passwordController,
              hintext: "********",
              lavelText: 'Password',
              onFieldSubmitted: (v){
                repeatPasswordFocus.requestFocus();
              },
              validate: (v)=>Validations().validatePassword(v),
            ),
            TextFormCustom(
              obscureText: true,
              focusNode: repeatPasswordFocus,
              textController: repeatPasswordController,
              hintext: "********",
              lavelText: 'Repeat Password',
              validate: (v) => Validations().validateRepetPassword(v,passwordController.text),
            ),
            BotomSendWidget(
              textButtom: "Send",
              onTap: (){
               send(context);
              }
            ),

          ],
        ),
      ),
    );
  }

  send(context) async {
    load(context);

    if(!formKey.currentState.validate()){
      Navigator.pop(context);
      return;
    }

    await  firebase.createUserWithEmailAndPassword( email: emailController.text.trim(), password: passwordController.text.trim()).then((value) {
       Navigator.pop(context);
       Navigator.pop(context);
       alerta(context,code: false,contenido: "Perfect, you are ready to start.",titulo: "Success");
    }).catchError((c){
       Navigator.pop(context);
       alerta(context,code: false,contenido: c.code.toString().replaceAll('_', ' ').toUpperCase()+'.'  ,titulo: "Error");
    });


  }
}