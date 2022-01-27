import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_test/src/modules/Posts/ui/widgets/list_post.dart';
import 'package:proyect_test/src/modules/load_picture/ui/screen/load_picture.dart';
import 'package:proyect_test/src/modules/posts/provider/posts_provider.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key); 
  static String pageName = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostsProvider postsProvider;
  
  @override
  Widget build(BuildContext context) {
         postsProvider = Provider.of<PostsProvider>(context);
  
    final _kTabPages = <Widget>[
     const LoadPicture(),
     const PostsList()
    ];

    final _kTabs = <Tab>[
      const Tab(text: 'Upload a picture'),
      const Tab(text: 'HTTP Request')
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(

        appBar: AppBar(

          automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text('Home Page'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: _kTabs,
          ),
          actions: [
            IconButton(onPressed: (){ logOut(context); },icon: const Icon(Icons.logout_rounded,color: Colors.white),),
            IconButton(onPressed: (){postsProvider.reload(); },icon: const Icon(Icons.replay_rounded,color: Colors.white),)
          ],
        ),

        body: TabBarView(
          children: _kTabPages,
        ),

        
      ),
    );
  }

  logOut(context) async {
    // load(context);
    await FirebaseAuth.instance.signOut();
    // Navigator.pop(context);
    Navigator.pushReplacementNamed(context, 'login');
  }

}
