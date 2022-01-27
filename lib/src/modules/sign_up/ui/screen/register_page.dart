import 'package:flutter/material.dart';
import 'package:proyect_test/src/modules/sign_up/ui/widgets/body_login_page.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key key}) : super(key: key);
  static String pageName = "home_page";
  Size size; 
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
              Icon(Icons.app_registration_rounded,color: Colors.white,),
              Text(' LognUp'),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: const SingleChildScrollView(child: BodyRegisterPage(key: Key('Rg1'),)),
    );
  }
}