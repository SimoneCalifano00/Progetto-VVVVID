import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/episodic_product_screen.dart';
import 'package:new_vvvvid/screens/film_product_screen.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/user_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem(this.product, this.currUser);
  final User currUser;

  void onSelectProduct(BuildContext context) {
    if (product.isEpisodic == true) {
      pushNewScreen(context, screen: EpisodicProductScreen(currUser, product));
    } else if (product.isFilm) {
      pushNewScreen(context, screen: FilmProductScreen(product, currUser));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => onSelectProduct(context),
      child: Container(
        width: _displayWidth * 0.4,
        height: _displayHeight * 0.5,
        child: Card(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                    child: Image.network(
                  product.previewImgUrl,
                  fit: BoxFit.cover,
                )),
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
