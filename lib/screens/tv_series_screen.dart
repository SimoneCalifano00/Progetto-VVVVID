import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/widgets/carousel.dart';
import 'package:new_vvvvid/widgets/product_item.dart';

class TvSeriesScreen extends StatelessWidget {
  TvSeriesScreen({Key? key}) : super(key: key);
  static const routePath = "/SerieTV";
  final productList =
      DUMMY_PRODUCTS.where((product) => product.isSerieTV == true).toList();

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
          height: (_displayHeight - _displayPaddingBottom - _displayPaddingTop),
          width: _displayWidth,
          child: Column(
            children: [
              const Text('Generi'),
              const Text('Genere 1'),
              Carousel(productList),
            ],
          )),
    );
  }
}
