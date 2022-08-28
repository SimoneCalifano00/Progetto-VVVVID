import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/carousel.dart';
import 'package:new_vvvvid/widgets/product_item.dart';
import 'package:new_vvvvid/widgets/tv_series_widget.dart';

class TvSeriesScreen extends StatelessWidget {
  TvSeriesScreen({Key? key}) : super(key: key);
  static const routePath = "/SerieTV";

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(const TvSeriesContainer());
  }
}
