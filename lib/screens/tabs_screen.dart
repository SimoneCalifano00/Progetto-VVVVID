import 'package:flutter/material.dart';
import 'package:new_vvvvid/screens/anime_screen.dart';
import 'package:new_vvvvid/screens/film_screen.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/tv_series_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _buildScreens() {
    return [
      HomePageScreen(),
      AnimeScreen(),
      TvSeriesScreen(),
      FilmScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.black87,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Anime"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.black87,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Serie TV"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.black87,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
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

    return PersistentTabView(
      context,

      controller: _controller,
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
      navBarStyle: NavBarStyle.style1,

      // Choose the nav bar style with this property.
    );
  }
}
