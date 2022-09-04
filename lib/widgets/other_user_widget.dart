import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/screens/episodic_product_screen.dart';
import 'package:new_vvvvid/screens/film_product_screen.dart';
import 'package:new_vvvvid/screens/modify_user_screen.dart';
import 'package:new_vvvvid/screens/other_user_screen.dart';
import 'package:new_vvvvid/screens/user_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OtherUserContainer extends StatefulWidget {
  const OtherUserContainer(this.pageUser, this.currUser);
  final User currUser;
  final User pageUser;

  @override
  State<OtherUserContainer> createState() => _OtherUserContainerState();
}

class _OtherUserContainerState extends State<OtherUserContainer> {
  void addFriend() {
    setState(() {
      widget.currUser.friendList!.add(widget.pageUser);
    });
  }

  void removeFriend() {
    setState(() {
      widget.currUser.friendList!.remove(widget.pageUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    final _displayPaddingBottom = MediaQuery.of(context).padding.bottom;
    final _displayPaddingTop = MediaQuery.of(context).padding.top;

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
                        height: _displayHeight * 0.17,
                        width: _displayWidth * 0.36,
                        decoration: BoxDecoration(
                            image: widget.pageUser.localPic == ""
                                ? DecorationImage(
                                    image: NetworkImage(
                                        widget.pageUser.profilePicUrl),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: FileImage(
                                        File(widget.pageUser.localPic)),
                                    fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _displayHeight * 0.07,
                            width: _displayWidth * 0.4,
                            child: Text(
                              widget.pageUser.username,
                              style: Theme.of(context).textTheme.headline6,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _displayHeight * 0.12,
                                  width: _displayWidth * 0.5,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      widget.pageUser.bio,
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
                      !widget.currUser.friendList!.contains(widget.pageUser)
                          ? InkWell(
                              onTap: addFriend,
                              child: Icon(
                                CupertinoIcons.add_circled,
                                color: const Color.fromARGB(255, 252, 56, 98),
                                size: 30,
                              ),
                            )
                          : InkWell(
                              onTap: removeFriend,
                              child: Icon(
                                CupertinoIcons.add_circled_solid,
                                color: const Color.fromARGB(255, 252, 56, 98),
                                size: 30,
                              ),
                            )
                    ]),
              ),
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
                                            widget.pageUser.friendList![index],
                                            widget.currUser)),
                                    child: ListTile(
                                      dense: true,
                                      minLeadingWidth: 1,
                                      visualDensity: VisualDensity.compact,
                                      leading: CircleAvatar(
                                        foregroundImage: NetworkImage(widget
                                            .pageUser
                                            .friendList![index]
                                            .profilePicUrl),
                                        backgroundColor: Colors.grey,
                                      ),
                                      title: Text(
                                        widget.pageUser.friendList![index]
                                            .username,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: widget.pageUser.friendList!.length,
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
                                            .pageUser
                                            .favouriteProducts![index]
                                            .isEpisodic
                                        ? pushDynamicScreen(context,
                                            screen: pushNewScreen(context,
                                                screen: EpisodicProductScreen(
                                                    widget.currUser,
                                                    widget.pageUser
                                                            .favouriteProducts![
                                                        index])))
                                        : pushNewScreen(context,
                                            screen: FilmProductScreen(
                                                widget.pageUser
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
                                                            .pageUser
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
                                                    .pageUser
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
                                    widget.pageUser.favouriteProducts!.length,
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
                                                              .pageUser
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
                                                      .pageUser
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
                                    widget.pageUser.favouriteCharacters!.length,
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
