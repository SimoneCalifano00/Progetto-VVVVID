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
import 'package:new_vvvvid/widgets/new_reply.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ReplyItem extends StatefulWidget {
  const ReplyItem(this.reply, this.currUser);
  final Reply reply;
  final User currUser;

  @override
  State<ReplyItem> createState() => _ReplyItemState();
}

class _ReplyItemState extends State<ReplyItem> {
  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    User commentUser = DUMMY_USERS
        .firstWhere((user) => user.id == widget.reply.userCommentingId);

    bool haveUserLiked() {
      if (widget.reply.idLikes.contains(widget.currUser.id)) {
        return true;
      } else {
        return false;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            title: Text(commentUser.username,
                style: Theme.of(context).textTheme.bodyText1),
            subtitle: Text(widget.reply.text,
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
                  widget.reply.date.day.toString() +
                      '/' +
                      widget.reply.date.month.toString() +
                      '/' +
                      widget.reply.date.year.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              !haveUserLiked()
                  ? IconButton(
                      icon: Icon(Icons.thumb_up_alt_outlined,
                          color: const Color.fromARGB(255, 252, 56, 98)),
                      onPressed: () {
                        setState(() {
                          widget.reply.idLikes.add(widget.currUser.id);
                          widget.reply.likes = widget.reply.likes + 1;
                        });
                      },
                      enableFeedback: true,
                    )
                  : IconButton(
                      icon: Icon(Icons.thumb_up_alt,
                          color: const Color.fromARGB(255, 252, 56, 98)),
                      onPressed: () {
                        setState(() {
                          widget.reply.idLikes.remove(widget.currUser.id);
                          widget.reply.likes = widget.reply.likes - 1;
                        });
                      },
                      enableFeedback: true,
                    ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: _displayHeight * 0.018,
                      right: _displayWidth * 0.015),
                  child: Text(widget.reply.likes.toString())),
            ],
          ),
        ),
      ],
    );
  }
}
