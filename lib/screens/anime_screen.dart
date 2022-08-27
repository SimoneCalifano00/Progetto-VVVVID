import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/widgets/carousel.dart';
import 'package:new_vvvvid/widgets/product_item.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class AnimeScreen extends StatelessWidget {
  AnimeScreen();
  static const String routePath = "/Anime";

  final productList =
      DUMMY_PRODUCTS.where((product) => product.isAnime == true).toList();

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;
    return Container(
        margin: EdgeInsets.only(
            top: _displayHeight * 0.03,
            left: _displayWidth * 0.02,
            right: _displayWidth * 0.02),
        height: (_displayHeight - _displayPaddingBottom - _displayPaddingTop),
        width: _displayWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*ElevatedButton(
                onPressed: () =>
                    pushNewScreen(context, screen: HomePageScreen()),
                child: Text('VVVVID')),*/
            Container(
              width: _displayWidth * 0.4,
              height: _displayHeight * 0.05,
              child: const Card(
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Generi',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _displayHeight * 0.02,
            ),
            Container(
              width: _displayWidth * 0.4,
              height: _displayHeight * 0.05,
              child: const Card(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Genere 1',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            Container(
              width: _displayWidth,
              height: _displayHeight * 0.335,
              child: Carousel(productList),
            )
          ],
        ));
  }
}
