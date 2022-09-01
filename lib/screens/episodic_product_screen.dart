import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/episodic_product_widget.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';

class EpisodicProductScreen extends StatelessWidget {
  EpisodicProductScreen(this.currUser, this.selectedProduct);

  static const String routePath = "/Product";
  final User currUser;
  final Products selectedProduct;

  @override
  Widget build(BuildContext context) {
    // final Products selectedProduct =
    //  ModalRoute.of(context)!.settings.arguments as Products;

    return AppbarAndScreen(
        EpisodicProductContainer(selectedProduct, currUser), currUser);
  }
}
