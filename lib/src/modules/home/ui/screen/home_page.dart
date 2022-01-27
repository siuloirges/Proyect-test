import 'package:flutter/material.dart';
import 'package:proyect_test/src/utils/components/ui/styles/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key); 
  static String pageName = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  
    final _kTabPages = <Widget>[
      Scaffold(
        body: _sitio(),
      ),
      crearProductos()
    ];

    final _kTabs = <Tab>[
      const Tab(text: '1'),
      const Tab(text: '2')
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text('Home Page'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: _kTabs,
          ),

        ),

        // drawer: Drawer(child: crearmenulateral(context)),
//floatingActionButton: ,
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }

  Widget _sitio() {
    return Container();
  }

  Widget crearProductos() {
    return Container();
  }

}
