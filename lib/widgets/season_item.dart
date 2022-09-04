import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/season.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/episode_screen.dart';
import 'package:new_vvvvid/screens/video_player_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SeasonItem extends StatelessWidget {
  final Season season;
  final User currUser;
  const SeasonItem(this.season, this.currUser);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black54,
        child: Column(
          children: [
            Text(
              'Lista Episodi S' + season.sNumber.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: InkWell(
                    onTap: () => pushNewScreen(context,
                        screen: EpisodeScreen(
                            season.episodes[index], season, currUser)),
                    child: Text(
                      '#' +
                          season.episodes[index].nEpisode.toString() +
                          '-' +
                          season.episodes[index].title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () => pushNewScreen(
                      context,
                      screen: VideoPlayerScreen(
                          currUser,
                          season.productTitle,
                          season.episodes[index].title,
                          season.episodes[index].nEpisode),
                      withNavBar: false,
                    ),
                    child: const Icon(
                      Icons.play_circle_fill_outlined,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              itemCount: season.nEpisodes,
            )),
          ],
        ));
  }
}
