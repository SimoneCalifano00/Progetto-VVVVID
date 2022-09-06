import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/characters.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/character_screen.dart';
import 'package:new_vvvvid/screens/other_user_screen.dart';
import 'package:new_vvvvid/screens/user_screen.dart';
import '../screens/episodic_product_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../screens/film_product_screen.dart';

class SearchCharacterItem extends StatelessWidget {
  SearchCharacterItem(
      this.searchCharacter, this.query, this.suggestion, this.currUser);

  final Character searchCharacter;
  String query;
  final Character suggestion;
  final User currUser;

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        query = suggestion.name;
        pushNewScreen(context,
            screen: CharacterScreen(searchCharacter, currUser));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _displayWidth * 0.003),
        child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(searchCharacter.characterPic),
                        fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.only(
                    right: _displayWidth * 0.02, top: _displayHeight * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.02),
                      child: Text(
                        searchCharacter.name,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: _displayHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.02),
                      child: Text(
                        'Personaggio',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _displayWidth * 0.02),
                      child: Text(
                        searchCharacter.bio,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
