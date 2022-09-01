import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/film_product_item.dart';

class FilmProductScreen extends StatelessWidget {
  const FilmProductScreen(this.film, this.currUser);
  final Products film;
  final User currUser;

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(FilmProductContainer(film, currUser), currUser);
  }
}
