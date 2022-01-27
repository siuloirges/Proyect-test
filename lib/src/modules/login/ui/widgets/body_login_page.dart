// ignore_for_file: must_be_immutable, null_aware_before_operator
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/boton_send_widget.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/fext_form_custom.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/global_widgets.dart';
import 'package:proyect_test/src/utils/providers/validaciones_utils.dart';

class BodyLoginPage extends StatefulWidget {
  

  const BodyLoginPage({Key key}) : super(key: key);

  @override
  State<BodyLoginPage> createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<BodyLoginPage> {

  var formKey = GlobalKey<FormState>();

  FirebaseAuth firebase = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

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
              },
              validate: (v)=>Validations().validatePassword(v),
            ),
            BotomSendWidget(
              textButtom: "Login",
              onTap: (){
                login(context);
              }
            ),
            TextButton(onPressed: (){  Navigator.pushNamed(context, 'register'); },child: const Text("SignUp",style: TextStyle(color: primaryColor ),), )
          ],
        ),
      ),
    );
  }

    login(BuildContext context) {

      load(context);

      if (!formKey.currentState.validate()) {
         Navigator.pop(context);
         return;
      }

        firebase.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
        .then((value) {
          passwordController.text = ""; emailController.text = "";
          Navigator.pushReplacementNamed(context,"home");
        }).catchError((c){
          Navigator.pop(context);
          alerta(context,code: false,contenido: c.code?.toString()?.replaceAll('_', ' ')?.toUpperCase()+'.'  ,titulo: "Error");
        }).timeout( const Duration(seconds: 50,),onTimeout: (){
          Navigator.pop(context);
          alerta(context,code: false,contenido:"check your internet connection"  ,titulo: "Error");
        });

  }
}