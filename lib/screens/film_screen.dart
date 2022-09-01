import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/film_widget.dart';
import 'package:new_vvvvid/widgets/product_item.dart';
import '../widgets/carousel.dart';
import '../models/dummy_products.dart';

class FilmScreen extends StatelessWidget {
  FilmScreen(this.currUser);
  final User currUser;
  static const routePath = "/Film";

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(FilmContainer(currUser), currUser);
  }
}
