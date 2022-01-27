import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/modules/login/ui/widgets/body_login_page.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';
import 'package:proyect_test/src/utils/providers/authentication_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  static String pageName = "home_page";
  Size size; 
  AuthenticationProvider authenticationProvider;
  @override
  Widget build(BuildContext context) {
    authenticationProvider = Provider.of<AuthenticationProvider>(context);
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
              Icon(Icons.login_rounded,color: Colors.white,),
              Text(' Login'),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(child: BodyLoginPage(key: const Key('Lg1'),)),
    );
  }
}