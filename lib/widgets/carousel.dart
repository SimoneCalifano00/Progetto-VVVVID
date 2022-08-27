import 'package:flutter/material.dart';
import '../models/products.dart';
import 'product_item.dart';

class Carousel extends StatelessWidget {
  final List<Products> list;
  const Carousel(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductItem(list[index]);
        },
        itemCount: list.length,
      ),
    );
  }
}
