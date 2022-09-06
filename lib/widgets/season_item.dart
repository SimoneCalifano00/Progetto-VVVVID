import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/models/genere.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/season.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/episode_screen.dart';
import 'package:new_vvvvid/screens/video_player_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SeasonItem extends StatefulWidget {
  final Season season;
  final User currUser;
  final Products product;
  const SeasonItem(this.season, this.currUser, this.product);

  @override
  State<SeasonItem> createState() => _SeasonItemState();
}

class _SeasonItemState extends State<SeasonItem> {
  void addGenere(User currUser, Products product) {
    List<String> generiProdotto = product.generi;

    for (Generi g in currUser.generi!) {
      print(g);
      if (generiProdotto.contains(g.nome)) {
        setState(() {
          g.rating = g.rating + 1;
        });

        print('G ADDIZIONATO ' + g.rating.toString());
      }
    }
  }

  void addContinuaGuardare() {
    setState(() {
      widget.currUser.continuaAGuardare.add(widget.product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black54,
        child: Column(
          children: [
            Text(
              'Lista Episodi S' + widget.season.sNumber.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: InkWell(
                    onTap: () => pushNewScreen(context,
                        screen: EpisodeScreen(widget.season.episodes[index],
                            widget.season, widget.currUser)),
                    child: Text(
                      '#' +
                          widget.season.episodes[index].nEpisode.toString() +
                          '-' +
                          widget.season.episodes[index].title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      addGenere(widget.currUser, widget.product);
                      addContinuaGuardare();
                      pushNewScreen(
                        context,
                        screen: VideoPlayerScreen(
                            widget.currUser,
                            widget.season.productTitle,
                            widget.season.episodes[index].title,
                            widget.season.episodes[index].nEpisode),
                        withNavBar: false,
                      );
                    },
                    child: const Icon(
                      Icons.play_circle_fill_outlined,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              itemCount: widget.season.nEpisodes,
            )),
          ],
        ));
  }
}
