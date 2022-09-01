import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import '../models/products.dart';
import 'product_item.dart';

class Carousel extends StatelessWidget {
  final List<Products> list;
  final User currUser;
  Carousel(this.list, this.currUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductItem(list[index], currUser);
        },
        itemCount: list.length,
      ),
    );
  }
}
