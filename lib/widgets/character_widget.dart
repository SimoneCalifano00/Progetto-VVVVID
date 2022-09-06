import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/characters.dart';
import 'package:new_vvvvid/models/dummy_products.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';

class CharacterWidget extends StatefulWidget {
  const CharacterWidget(this.character, this.currUser);

  final User currUser;
  final Character character;

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  void addCharacter() {
    setState(() {
      widget.currUser.favouriteCharacters!.add(widget.character);
    });
  }

  void removeCharacter() {
    setState(() {
      widget.currUser.favouriteCharacters!.remove(widget.character);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;

    Products prodotto = DUMMY_PRODUCTS
        .firstWhere((element) => element.id == widget.character.idProdotto);
    return Container(
      margin: EdgeInsets.only(
          top: _displayHeight * 0.03,
          left: _displayWidth * 0.02,
          right: _displayWidth * 0.02),
      height: (_displayHeight - _displayPaddingBottom - _displayPaddingTop),
      width: _displayWidth,
      child: SingleChildScrollView(
        child: SizedBox(
          height: _displayHeight * 0.7,
          width: _displayWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: _displayHeight * 0.32,
                        width: _displayWidth * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(widget.character.characterPic),
                                fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _displayHeight * 0.13,
                            width: _displayWidth * 0.33,
                            child: Text(
                              widget.character.name,
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          SizedBox(
                            width: _displayWidth * 0.4,
                            height: _displayHeight * 0.05,
                            child: Row(
                              children: [
                                Text(
                                  'from: ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  overflow: TextOverflow.fade,
                                ),
                                Flexible(
                                  child: Container(
                                    child: Text(
                                      prodotto.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      !widget.currUser.favouriteCharacters!
                              .contains(widget.character)
                          ? InkWell(
                              onTap: addCharacter,
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: const Color.fromARGB(255, 252, 56, 98),
                                size: 30,
                              ),
                            )
                          : InkWell(
                              onTap: removeCharacter,
                              child: Icon(
                                Icons.favorite,
                                color: const Color.fromARGB(255, 252, 56, 98),
                                size: 30,
                              ),
                            )
                    ]),
              ),
              SizedBox(
                height: _displayHeight * 0.33,
                width: _displayWidth,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          'Descrizione',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: _displayHeight * 0.02,
                        ),
                        Text(widget.character.bio,
                            style: Theme.of(context).textTheme.bodyText2)
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
