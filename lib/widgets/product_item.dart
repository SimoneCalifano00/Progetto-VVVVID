import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/screens/episodic_product_screen.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:new_vvvvid/screens/user_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem(this.product);

  void onSelectProduct(BuildContext context) {
    if (product.isEpisodic == true) {
      pushNewScreenWithRouteSettings(context,
          screen: const EpisodicProductScreen(),
          settings: RouteSettings(
              name: EpisodicProductScreen.routePath, arguments: product));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => onSelectProduct(context),
      child: Container(
        width: _displayWidth * 0.45,
        height: _displayHeight * 0.5,
        child: Card(
            color: Colors.black,
            child: Column(
              children: [
                ClipRRect(
                    child: Image.network(
                  product.previewImgUrl,
                  fit: BoxFit.cover,
                )),
                SizedBox(
                  height: _displayHeight * 0.008,
                ),
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
