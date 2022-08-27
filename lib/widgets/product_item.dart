import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/screens/homepage.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    void onSelectProduct() {
      Navigator.of(context).pushNamed(HomePageScreen.routePath);
    }

    return InkWell(
      onTap: onSelectProduct,
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
