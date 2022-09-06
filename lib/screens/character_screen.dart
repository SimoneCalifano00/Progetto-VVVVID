import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/characters.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/character_widget.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen(this.character, this.currUser);
  final Character character;
  final User currUser;

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(CharacterWidget(character, currUser), currUser);
  }
}
