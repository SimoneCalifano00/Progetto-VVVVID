import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/characters.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/character_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem(this.character, this.currUser);
  final Character character;
  final User currUser;

  void onSelectCharacter(BuildContext context) {
    pushNewScreen(context, screen: CharacterScreen(character, currUser));
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => onSelectCharacter(context),
      child: Container(
        width: _displayWidth * 0.45,
        height: _displayHeight * 0.5,
        child: Card(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                      child: Image.network(
                    character.characterPic,
                    fit: BoxFit.cover,
                  )),
                ),
                Text(
                  character.name,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
