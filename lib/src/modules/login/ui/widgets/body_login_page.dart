// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/boton_send_widget.dart';
import 'package:proyect_test/src/utils/components/ui/widgets/fext_form_custom.dart';
import 'package:proyect_test/src/utils/providers/authentication_provider.dart';

class BodyLoginPage extends StatefulWidget {
  

  BodyLoginPage({Key key}) : super(key: key);

  @override
  State<BodyLoginPage> createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<BodyLoginPage> {

  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

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
            ),
            TextFormCustom(
              obscureText: true,
              focusNode: passwordFocus,
              textController: passwordController,
              hintext: "********",
              lavelText: 'Password',
            ),
            BotomSendWidget(
              textButtom: "Login",
              onTap: (){
                Navigator.pushNamed(context, 'home');
              }
            ),
            TextButton(onPressed: (){  Navigator.pushNamed(context, 'register'); },child: const Text("SignUp",style: TextStyle(color: primaryColor ),), )
          ],
        ),
      ),
    );
  }
}