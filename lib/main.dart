import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';
import 'package:proyect_test/src/utils/providers/authentication_provider.dart';
import 'package:proyect_test/src/utils/routes/routes.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
      ],
      child: OKToast(
        handleTouch: true,
        child: MaterialApp(
         
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
