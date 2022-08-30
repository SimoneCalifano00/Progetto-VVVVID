import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/season.dart';
import 'package:flutter/material.dart';

class SeasonItem extends StatelessWidget {
  final Season season;
  const SeasonItem(this.season);

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
                  title: Text(
                    '#' +
                        season.episodes[index].nEpisode.toString() +
                        '-' +
                        season.episodes[index].title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  trailing: const Icon(
                    Icons.play_circle_fill_outlined,
                    color: Colors.white,
                  ),
                );
              },
              itemCount: season.nEpisodes,
            )),
          ],
        ));
  }
}
