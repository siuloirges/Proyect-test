import 'package:flutter/cupertino.dart';
import 'package:proyect_test/src/modules/home/ui/screen/home_page.dart';
import 'package:proyect_test/src/modules/login/ui/screen/login_page.dart';
import 'package:proyect_test/src/modules/sign_up/ui/screen/login_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> getRoutes(){
   return  {
    'home' : (context) => const HomePage(key: Key("home")),
    'login' : (context) => LoginPage(key: const Key("login")),
    'register' : (context) => RegisterPage(key: const Key("register")),
   };
  } 
}