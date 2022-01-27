import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/modules/posts/provider/posts_provider.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';
import 'package:proyect_test/src/modules/load_picture/provider/load_picture_provider.dart';
import 'package:proyect_test/src/utils/routes/routes.dart';

void main() async => runApp(const MyApp()); 

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadPictureProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>  PostsProvider(),
        ),
      ],
      child: OKToast(
        handleTouch: true,
        child: MaterialApp(
          locale: const Locale('es', 'CO'),
          debugShowCheckedModeBanner: false,
          title: 'Technical Test',
          initialRoute: 'login',
          theme: mainTheme,
          routes: Routes.getRoutes() ,
        ),
      ),
    );
  }
}
