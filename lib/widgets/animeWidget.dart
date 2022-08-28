import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'carousel.dart';
import '../models/dummy_products.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';

class AnimeContainer extends StatelessWidget {
  const AnimeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productList =
        DUMMY_PRODUCTS.where((product) => product.isAnime == true).toList();

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
            ElevatedButton(
                onPressed: () => pushNewScreen(context, screen: UserScreen()),
                child: Text('VVVVID')),
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
