import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/episodic_product_screen.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/login_screen.dart';
import 'package:new_vvvvid/screens/tabs_screen.dart';
import 'package:new_vvvvid/screens/user_screen.dart';
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
              labelMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'Raleway'),
              bodyText2: TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: 'Raleway'),
              headline3: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
              headline4: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
              headline5: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'RobotoCondensed',
              ),
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'RobotoCondensed',
              ))),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.currUser);
  final User currUser;
  static const String routePath = '/Home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: TabsScreen(widget.currUser),
    );
  }
}

class TabsScreen extends StatefulWidget {
  TabsScreen(this.currUser);
  final User currUser;
  static const String routePath = '/Tabs';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _buildScreens() {
    return [
      HomePageScreen(widget.currUser),
      AnimeScreen(widget.currUser),
      TvSeriesScreen(widget.currUser),
      FilmScreen(widget.currUser),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.house_alt),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.black87,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.view_2d),
        title: ("Anime"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.black87,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.tv_outlined),
        title: ("Serie TV"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.black87,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.film),
        title: ("Film"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.black87,
      ),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayHeight = MediaQuery.of(context).size.height;

    return PersistentTabView(
      context,
      controller: _controller,
      navBarHeight: _displayHeight * 0.08,
      onItemSelected: (index) {
        setState(() {
          _controller.index = index;
        });
      },
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 252, 56, 98),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.neumorphic,
      neumorphicProperties: NeumorphicProperties(
          showSubtitleText: true,
          bevel: 8,
          curveType: CurveType.convex,
          borderRadius: 9),
      // Choose the nav bar style with this property.
    );
  }
}
