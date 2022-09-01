import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/homepageWidget.dart';
import '../models/dummy_products.dart';
import '../widgets/carousel.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen(this.currUser);
  final User currUser;
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(HomepageContainer(currUser), currUser);
  }
}
