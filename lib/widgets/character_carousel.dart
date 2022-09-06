import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/characters.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/character_item.dart';

class CharacterCarousel extends StatelessWidget {
  const CharacterCarousel(this.characters, this.currUser);
  final List<Character> characters;
  final User currUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CharacterItem(characters[index], currUser);
        },
        itemCount: characters.length,
      ),
    );
  }
}
