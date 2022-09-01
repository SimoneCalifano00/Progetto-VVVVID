import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/user_screen.dart';
import 'package:new_vvvvid/widgets/animeWidget.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/carousel.dart';
import 'package:new_vvvvid/widgets/product_item.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../models/user.dart';

class AnimeScreen extends StatelessWidget {
  AnimeScreen(this.currUser);
  final User currUser;
  static const String routePath = "/Anime";

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(AnimeContainer(currUser), currUser);
  }
}
