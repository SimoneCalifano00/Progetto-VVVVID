import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/episode.dart';
import 'package:new_vvvvid/models/season.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/episode_widget.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen(this.episode, this.product, this.currUser);
  final Episode episode;
  final User currUser;
  final Season product;

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(
        EpisodeContainer(
          currUser,
          episode,
          product,
        ),
        currUser);
  }
}
