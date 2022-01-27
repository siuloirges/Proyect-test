import 'package:flutter/material.dart';
import 'package:proyect_test/src/modules/login/ui/widgets/body_login_page.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  Size size; 
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: const SingleChildScrollView(child: BodyLoginPage(key: Key('Lg1'),)),
    );
  }
}