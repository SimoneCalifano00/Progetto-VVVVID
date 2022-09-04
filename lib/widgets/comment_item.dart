import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/dummy_users.dart';
import 'package:new_vvvvid/models/reply.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/screens/other_user_screen.dart';
import 'package:new_vvvvid/widgets/new_reply.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CommentItem extends StatefulWidget {
  final Comment comment;
  final User currUser;
  const CommentItem(this.comment, this.currUser);

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  void _addReply(String reply) {
    final newReply = Reply(
        text: reply,
        date: DateTime.now(),
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

  @override
  Widget build(BuildContext context) {
    User commentUser =
        DUMMY_USERS.firstWhere((user) => user.id == widget.comment.creatorId);

    bool haveUserLiked() {
      if (widget.comment.idLikes!.contains(widget.currUser.id)) {
        return true;
      } else {
        return false;
      }
    }

    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            title: Text(commentUser.username,
                style: Theme.of(context).textTheme.bodyText1),
            subtitle: Text(widget.comment.text,
                style: Theme.of(context).textTheme.bodyText2),
            horizontalTitleGap: 21,
            leading: commentUser.localPic == ""
                ? InkWell(
                    onTap: () => pushNewScreen(context,
                        screen: OtherUserScreen(commentUser, widget.currUser)),
                    child: CircleAvatar(
                        foregroundImage:
                            NetworkImage(commentUser.profilePicUrl),
                        backgroundColor: Colors.grey,
                        radius: _displayWidth * 0.08),
                  )
                : InkWell(
                    onTap: () => pushNewScreen(context,
                        screen: OtherUserScreen(commentUser, widget.currUser)),
                    child: CircleAvatar(
                        foregroundImage: FileImage(File(commentUser.localPic)),
                        backgroundColor: Colors.grey,
                        radius: _displayWidth * 0.08),
                  )),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: _displayHeight * 0.02, right: _displayWidth * 0.05),
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
                          color: const Color.fromARGB(255, 252, 56, 98)),
                      onPressed: () {
                        setState(() {
                          widget.comment.idLikes!.add(widget.currUser.id);
                          widget.comment.likes = widget.comment.likes! + 1;
                        });
                      },
                      enableFeedback: true,
                    )
                  : IconButton(
                      icon: Icon(Icons.thumb_up_alt,
                          color: const Color.fromARGB(255, 252, 56, 98)),
                      onPressed: () {
                        setState(() {
                          widget.comment.idLikes!.remove(widget.currUser.id);
                          widget.comment.likes = widget.comment.likes! - 1;
                        });
                      },
                      enableFeedback: true,
                    ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: _displayHeight * 0.018,
                      right: _displayWidth * 0.015),
                  child: Text(widget.comment.likes.toString())),
              IconButton(
                  onPressed: () => startNewReply(context),
                  icon: Icon(Icons.add_comment_outlined,
                      color: const Color.fromARGB(255, 252, 56, 98))),
              Padding(
                padding: EdgeInsets.only(
                    bottom: _displayHeight * 0.018,
                    right: _displayWidth * 0.015),
                child: Text(widget.comment.replies!.length.toString()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
