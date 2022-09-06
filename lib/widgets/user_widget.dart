import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/character_screen.dart';
import 'package:new_vvvvid/screens/episodic_product_screen.dart';
import 'package:new_vvvvid/screens/film_product_screen.dart';
import 'package:new_vvvvid/screens/login_screen.dart';
import 'package:new_vvvvid/screens/modify_user_screen.dart';
import 'package:new_vvvvid/screens/other_user_screen.dart';
import 'package:new_vvvvid/widgets/season_item.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class UserContainer extends StatefulWidget {
  const UserContainer(this.currUser);

  final User currUser;

  @override
  State<UserContainer> createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;

    setState(() {});

    return Container(
      margin: EdgeInsets.only(
          top: _displayHeight * 0.03,
          left: _displayWidth * 0.02,
          right: _displayWidth * 0.02),
      height: (_displayHeight - _displayPaddingBottom - _displayPaddingTop),
      width: _displayWidth,
      child: SingleChildScrollView(
        child: SizedBox(
          width: _displayWidth,
          height: _displayHeight * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: _displayHeight * 0.17,
                        width: _displayWidth * 0.36,
                        decoration: BoxDecoration(
                            image: widget.currUser.localPic == ""
                                ? DecorationImage(
                                    image: NetworkImage(
                                        widget.currUser.profilePicUrl),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: FileImage(
                                        File(widget.currUser.localPic)),
                                    fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: _displayWidth * 0.007,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _displayHeight * 0.08,
                            width: _displayWidth * 0.4,
                            child: Text(
                              widget.currUser.username,
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            height: _displayHeight * 0.008,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _displayHeight * 0.12,
                                  width: _displayWidth * 0.4,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      widget.currUser.bio,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                pushNewScreen(context,
                                    screen: ModifyUserScreen(widget.currUser));
                              },
                              icon: Icon(Icons.settings),
                              color: const Color.fromARGB(255, 252, 56, 98),
                              iconSize: 35),
                          IconButton(
                              onPressed: () {
                                pushNewScreen(
                                  context,
                                  screen: LoginScreen(),
                                  withNavBar: false,
                                );
                              },
                              icon: Icon(Icons.logout),
                              color: const Color.fromARGB(255, 252, 56, 98),
                              iconSize: 35),
                        ],
                      )
                    ]),
              ),
              SizedBox(height: _displayHeight * 0.02),
              SizedBox(
                height: _displayHeight * 0.43,
                width: _displayWidth,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Lista amici',
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 1,
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height: _displayHeight * 0.4,
                              width: _displayWidth * 0.42,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemExtent: _displayWidth * 0.2,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => pushNewScreen(context,
                                        screen: OtherUserScreen(
                                            widget.currUser.friendList![index],
                                            widget.currUser)),
                                    child: ListTile(
                                      dense: true,
                                      minLeadingWidth: 1,
                                      visualDensity: VisualDensity.compact,
                                      leading: CircleAvatar(
                                        foregroundImage: NetworkImage(widget
                                            .currUser
                                            .friendList![index]
                                            .profilePicUrl),
                                        backgroundColor: Colors.grey,
                                      ),
                                      title: Text(
                                        widget.currUser.friendList![index]
                                            .username,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  );
                                  /*return InkWell(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: _displayWidth * 0.003),
                                      child: Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              currUser
                                                                  .friendList![
                                                                      index]
                                                                  .profilePicUrl),
                                                          fit: BoxFit.scaleDown)),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      right: _displayWidth * 0.02,
                                                      top: _displayHeight * 0.04),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: _displayWidth *
                                                                0.02),
                                                        child: Text(
                                                          currUser
                                                              .friendList![index]
                                                              .username,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headline6,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            _displayHeight * 0.02,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  );*/
                                },
                                itemCount: widget.currUser.friendList!.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Prodotti preferiti',
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 1,
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height: _displayHeight * 0.4,
                              width: _displayWidth * 0.6,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemExtent: _displayWidth * 0.33,
                                itemBuilder: (context, index) {
                                  /*return ListTile(
                                    dense: true,
                                    minLeadingWidth: 1,
                                    visualDensity: VisualDensity.compact,
                                    leading: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Image.network(
                                        currUser.favouriteProducts![index]
                                            .previewImgUrl,
                                      ),
                                    ),
                                    title: Text(
                                      currUser.favouriteProducts![index].title,
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                  );*/
                                  return InkWell(
                                    onTap: () => widget
                                            .currUser
                                            .favouriteProducts![index]
                                            .isEpisodic
                                        ? pushNewScreen(context,
                                            screen: EpisodicProductScreen(
                                                widget.currUser,
                                                widget.currUser
                                                    .favouriteProducts![index]))
                                        : pushNewScreen(context,
                                            screen: FilmProductScreen(
                                                widget.currUser
                                                    .favouriteProducts![index],
                                                widget.currUser)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: _displayHeight * 0.01),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(widget
                                                            .currUser
                                                            .favouriteProducts![
                                                                index]
                                                            .previewImgUrl),
                                                        fit: BoxFit.scaleDown)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Text(
                                                widget
                                                    .currUser
                                                    .favouriteProducts![index]
                                                    .title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  );
                                },
                                itemCount:
                                    widget.currUser.favouriteProducts!.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Personaggi preferiti',
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 1,
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height: _displayHeight * 0.4,
                              width: _displayWidth * 0.6,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemExtent: _displayWidth * 0.33,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => pushNewScreen(context,
                                        screen: CharacterScreen(
                                            widget.currUser
                                                .favouriteCharacters![index],
                                            widget.currUser)),
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: _displayHeight * 0.01),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(widget
                                                              .currUser
                                                              .favouriteCharacters![
                                                                  index]
                                                              .characterPic),
                                                          fit: BoxFit
                                                              .scaleDown)),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Text(
                                                  widget
                                                      .currUser
                                                      .favouriteCharacters![
                                                          index]
                                                      .name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  );
                                },
                                itemCount:
                                    widget.currUser.favouriteCharacters!.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
