import 'package:flutter/cupertino.dart';
import 'package:proyect_test/src/modules/Posts/ui/screen/posts_page.dart';
import 'package:proyect_test/src/modules/home/ui/screen/home_page.dart';
import 'package:proyect_test/src/modules/load_picture/ui/screen/load_picture.dart';
import 'package:proyect_test/src/modules/login/ui/screen/login_page.dart';
import 'package:proyect_test/src/modules/posts/ui/widgets/post_detail.dart';
import 'package:proyect_test/src/modules/sign_up/ui/screen/register_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> getRoutes(){
   return  {
    'home' : (context) => const HomePage(key: Key("home")),
    'login' : (context) => LoginPage(key: const Key("login")),
    'register' : (context) => RegisterPage(key: const Key("register")),
    'load_picture' : (context) => const LoadPicture(key: Key("load_picture")),
    'posts_page' : (context) => const PostsPage(key: Key("posts_page")),
    'post_detal' : (context) => PostDetal(key: const Key("post_detal")),
   };
  } 
}