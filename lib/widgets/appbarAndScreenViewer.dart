import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/screens/homepage.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/user_screen.dart';

class AppbarAndScreen extends StatelessWidget {
  AppbarAndScreen(this.screen);

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          centerTitle: true,
          floating: true,
          title: Container(
              width: _displayWidth * 0.2,
              height: _displayHeight * 0.19,
              child: Image.asset('lib/assets/imgs/LogoVVVVID.jpg'),
              alignment: Alignment.center),
          leading: Padding(
            padding: EdgeInsets.all(_displayWidth * 0.02),
            child: InkWell(
              onTap: () => pushNewScreen(context, screen: UserScreen()),
              child: Image.network(
                  'https://github.com/SimoneCalifano00/Progetto-VVVVID/raw/master/Asset/default-user-icon-13.jpg'),
            ),
          ),
          leadingWidth: _displayWidth * 0.2,
        ),
      ],
      body: screen,
    ));
  }
}
