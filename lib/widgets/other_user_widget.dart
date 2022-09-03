import 'dart:io';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/screens/modify_user_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OtherUserContainer extends StatelessWidget {
  const OtherUserContainer(this.pageUser, this.currUser);
  final User currUser;
  final User pageUser;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _displayHeight * 0.17,
                  width: _displayWidth * 0.36,
                  decoration: BoxDecoration(
                      image: pageUser.localPic == ""
                          ? DecorationImage(
                              image: NetworkImage(pageUser.profilePicUrl),
                              fit: BoxFit.cover)
                          : DecorationImage(
                              image: FileImage(File(pageUser.localPic)),
                              fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: _displayWidth * 0.007,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pageUser.username,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: _displayHeight * 0.008,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: _displayHeight * 0.12,
                          width: _displayWidth * 0.4,
                          child: SingleChildScrollView(
                            child: Text(
                              pageUser.bio,
                              style: Theme.of(context).textTheme.bodyText2,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
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
                              return ListTile(
                                dense: true,
                                minLeadingWidth: 1,
                                visualDensity: VisualDensity.compact,
                                leading: CircleAvatar(
                                  foregroundImage: NetworkImage(pageUser
                                      .friendList![index].profilePicUrl),
                                  backgroundColor: Colors.grey,
                                ),
                                title: Text(
                                  pageUser.friendList![index].username,
                                  style: Theme.of(context).textTheme.bodyText2,
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
                            itemCount: pageUser.friendList!.length,
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
                                                      image: NetworkImage(pageUser
                                                          .favouriteProducts![
                                                              index]
                                                          .previewImgUrl),
                                                      fit: BoxFit.scaleDown)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Text(
                                              pageUser.favouriteProducts![index]
                                                  .title,
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
                            itemCount: pageUser.favouriteProducts!.length,
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
                                                      image: NetworkImage(pageUser
                                                          .favouriteCharacters![
                                                              index]
                                                          .characterPic),
                                                      fit: BoxFit.scaleDown)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Text(
                                              pageUser
                                                  .favouriteCharacters![index]
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
                            itemCount: pageUser.favouriteCharacters!.length,
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
    );
  }
}
