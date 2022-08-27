import 'package:flutter/material.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/tabs_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_vvvvid/screens/anime_screen.dart';
import 'package:new_vvvvid/screens/film_screen.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/tv_series_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New VVVVID',
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 252, 56, 98),
          appBarTheme:
              AppBarTheme(color: const Color.fromARGB(255, 252, 56, 98)),
          accentColor: Colors.black87,
          canvasColor: const Color.fromRGBO(40, 40, 40, 0.85),
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'Raleway'),
              bodyText2: TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: 'Raleway'),
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ))),
      home: MyHomePage(),
      routes: {
        //TabsScreen.routePath: (context) => const TabsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            title: Text('VVVVID'),
            leading: Padding(
              padding: EdgeInsets.all(_displayWidth * 0.02),
            ),
            leadingWidth: _displayWidth * 0.2,
          ),
        ],
        body: const TabsScreen(),
      ),
    );
  }
}
