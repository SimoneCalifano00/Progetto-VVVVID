import 'dart:io';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/episode.dart';
import 'package:new_vvvvid/models/season.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:flutter/material.dart';
import 'package:new_vvvvid/screens/video_player_screen.dart';
import 'package:new_vvvvid/widgets/comment_list.dart';
import 'package:new_vvvvid/widgets/new_comment.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class EpisodeContainer extends StatefulWidget {
  const EpisodeContainer(this.currUser, this.episode, this.product);

  final User currUser;
  final Episode episode;
  final Season product;

  @override
  State<EpisodeContainer> createState() => _EpisodeContainerState();
}

class _EpisodeContainerState extends State<EpisodeContainer> {
  void _addComment(String comment) {
    final newComment = Comment(
        creatorId: widget.currUser.id,
        text: comment,
        date: DateTime.now(),
        replies: [],
        idLikes: [],
        likes: 0);
    setState(() {
      widget.episode.comments!.add(newComment);
    });
  }

  void startNewComment(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewComment(_addComment, widget.currUser),
            behavior: HitTestBehavior.opaque,
          );
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: [
              SizedBox(
                height: _displayHeight * 0.08,
                width: _displayWidth * 0.95,
                child: Padding(
                  padding: EdgeInsets.only(left: _displayWidth * 0.04),
                  child: Text(
                    widget.product.productTitle,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                height: _displayHeight * 0.08,
                width: _displayWidth * 0.95,
                child: Padding(
                  padding: EdgeInsets.only(left: _displayWidth * 0.04),
                  child: Text(
                    'Episodio #' +
                        widget.episode.nEpisode.toString() +
                        ' "' +
                        widget.episode.title +
                        '"',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _displayHeight * 0.09,
                width: _displayWidth * 0.85,
                child: InkWell(
                  onTap: () => pushNewScreen(context,
                      screen: VideoPlayerScreen(
                          widget.currUser,
                          widget.product.productTitle,
                          widget.episode.title,
                          widget.episode.nEpisode),
                      withNavBar: false),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                              Colors.black,
                              const Color.fromARGB(255, 252, 56, 98),
                            ])),
                        height: _displayHeight * 0.085,
                        width: _displayWidth * 0.8,
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: _displayWidth * 0.01),
                                child: Text(
                                  'GUARDA ORA',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: _displayWidth * 0.01),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Comments

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: _displayHeight * 0.13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.currUser.localPic == ""
                          ? CircleAvatar(
                              foregroundImage:
                                  NetworkImage(widget.currUser.profilePicUrl),
                              backgroundColor: Colors.grey,
                              radius: _displayWidth * 0.08)
                          : CircleAvatar(
                              foregroundImage:
                                  FileImage(File(widget.currUser.localPic)),
                              backgroundColor: Colors.grey,
                              radius: _displayWidth * 0.08),
                      SizedBox(
                        width: _displayWidth * 0.04,
                      ),
                      GestureDetector(
                          onTap: () => startNewComment(context),
                          child: Text(
                            'Aggiungi nuovo commento...',
                            style: Theme.of(context).textTheme.headline4,
                          )),
                      SizedBox(
                        width: _displayWidth * 0.04,
                      ),
                      IconButton(
                          onPressed: () => startNewComment(context),
                          icon: Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.white),
                          iconSize: 20)
                    ],
                  )),
              CommentList(widget.episode.comments!, widget.currUser),
            ],
          ),
        ]),
      ),
    );
  }
}
