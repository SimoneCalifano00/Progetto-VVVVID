import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/dummy_users.dart';
import 'package:new_vvvvid/models/reply.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/other_user_screen.dart';
import 'package:new_vvvvid/widgets/comment_item.dart';
import 'package:new_vvvvid/widgets/new_reply.dart';
import 'package:new_vvvvid/widgets/reply_item.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class RepliesWidget extends StatefulWidget {
  const RepliesWidget(this.comment, this.currUser);

  final Comment comment;
  final User currUser;

  @override
  State<RepliesWidget> createState() => _RepliesWidgetState();
}

class _RepliesWidgetState extends State<RepliesWidget> {
  void _addReply(String reply) {
    final newReply = Reply(
        text: reply,
        date: DateTime.now(),
        likes: 0,
        userCommentingId: widget.currUser.id,
        idLikes: []);
    setState(() {
      widget.comment.replies!.add(newReply);
    });
  }

  void startNewReply(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewReply(_addReply, widget.currUser, widget.comment),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  bool haveUserLiked() {
    if (widget.comment.idLikes!.contains(widget.currUser.id)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    User commentUser =
        DUMMY_USERS.firstWhere((user) => user.id == widget.comment.creatorId);

    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _displayHeight * 0.03),
            Card(
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _displayHeight * 0.087,
                    width: _displayWidth * 0.9,
                    child: GestureDetector(
                      child: Flexible(
                        child: ListTile(
                            title: Text(commentUser.username,
                                style: Theme.of(context).textTheme.bodyText1),
                            subtitle: Text(widget.comment.text,
                                style: Theme.of(context).textTheme.bodyText2),
                            horizontalTitleGap: 21,
                            leading: commentUser.localPic == ""
                                ? InkWell(
                                    onTap: () => pushNewScreen(context,
                                        screen: OtherUserScreen(
                                            commentUser, widget.currUser)),
                                    child: CircleAvatar(
                                        foregroundImage: NetworkImage(
                                            commentUser.profilePicUrl),
                                        backgroundColor: Colors.grey,
                                        radius: _displayWidth * 0.08),
                                  )
                                : InkWell(
                                    onTap: () => pushNewScreen(context,
                                        screen: OtherUserScreen(
                                            commentUser, widget.currUser)),
                                    child: CircleAvatar(
                                        foregroundImage: FileImage(
                                            File(commentUser.localPic)),
                                        backgroundColor: Colors.grey,
                                        radius: _displayWidth * 0.08),
                                  )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _displayWidth * 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: _displayHeight * 0.019),
                          child: Text(
                            widget.comment.date.day.toString() +
                                '/' +
                                widget.comment.date.month.toString() +
                                '/' +
                                widget.comment.date.year.toString(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        !haveUserLiked()
                            ? IconButton(
                                icon: Icon(Icons.thumb_up_alt_outlined,
                                    color:
                                        const Color.fromARGB(255, 252, 56, 98)),
                                onPressed: () {
                                  setState(() {
                                    widget.comment.idLikes!
                                        .add(widget.currUser.id);
                                    widget.comment.likes =
                                        widget.comment.likes! + 1;
                                  });
                                },
                                enableFeedback: true,
                              )
                            : IconButton(
                                icon: Icon(Icons.thumb_up_alt,
                                    color:
                                        const Color.fromARGB(255, 252, 56, 98)),
                                onPressed: () {
                                  setState(() {
                                    widget.comment.idLikes!
                                        .remove(widget.currUser.id);
                                    widget.comment.likes =
                                        widget.comment.likes! - 1;
                                  });
                                },
                                enableFeedback: true,
                              ),
                        Padding(
                          padding: EdgeInsets.only(top: _displayHeight * 0.019),
                          child: Text(widget.comment.likes.toString()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _displayHeight * 0.02,
            ),
            SizedBox(
              height: _displayHeight * 0.07,
              width: _displayWidth,
              child: Padding(
                padding: EdgeInsets.only(left: _displayWidth * 0.013),
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
                        onTap: () => startNewReply(context),
                        child: Text(
                          'Aggiungi una nuova risposta',
                          style: Theme.of(context).textTheme.headline4,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: _displayWidth * 0.02),
              child: SizedBox(
                height: _displayHeight * 0.65,
                width: _displayWidth * 0.8,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemExtent: _displayHeight * 0.155,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  itemBuilder: (context, index) {
                    return ReplyItem(
                        widget.comment.replies![index], widget.currUser);
                  },
                  itemCount: widget.comment.replies!.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
