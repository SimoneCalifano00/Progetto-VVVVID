import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/season.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/season_item.dart';

class SeasonCarousel extends StatelessWidget {
  final List<Season>? seasons;
  final User currUser;
  const SeasonCarousel(this.seasons, this.currUser);

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _displayHeight * 0.4,
      width: _displayWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: _displayWidth * 0.73,
        itemBuilder: (context, index) {
          return SeasonItem(seasons![index], currUser);
        },
        itemCount: seasons!.length,
      ),
    );
  }
}
