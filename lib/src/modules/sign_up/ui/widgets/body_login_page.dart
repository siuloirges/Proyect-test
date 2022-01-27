// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/boton_send_widget.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/fext_form_custom.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/global_widgets.dart';
import 'package:proyect_test/src/utils/providers/authentication_provider.dart';
import 'package:proyect_test/src/utils/providers/validaciones_utils.dart';

class BodyRegisterPage extends StatefulWidget {
  

  BodyRegisterPage({Key key}) : super(key: key);

  @override
  State<BodyRegisterPage> createState() => _BodyRegisterPageState();
}

class _BodyRegisterPageState extends State<BodyRegisterPage> {

  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode repeatPasswordFocus = FocusNode();

  AuthenticationProvider authenticationProvider;

  @override
  Widget build(BuildContext context) {
    authenticationProvider = Provider.of<AuthenticationProvider>(context);
    
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
              validate: (v)=>Validations().validateRepetPassword(v,passwordController.text),
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

  send(context){
    load(context);

    if(!formKey.currentState.validate()){
      Navigator.pop(context);
      return;
    }

    try{
      authenticationProvider.sinInWithCredentials(emailController.text.trim(), passwordController.text.trim());
    }catch(e){
      alerta(context,titulo: "Error interno",code: false,contenido: e.toString());
      Navigator.pop(context);
      return;
    }

  }
}