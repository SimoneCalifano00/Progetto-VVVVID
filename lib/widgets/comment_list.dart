import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/comment_item.dart';

class CommentList extends StatelessWidget {
  final List<Comment> comments;
  final User currUser;
  const CommentList(this.comments, this.currUser);

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _displayHeight * 0.4,
      width: _displayWidth * 0.85,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemExtent: _displayHeight * 0.16,
        itemBuilder: (context, index) {
          return CommentItem(comments[index], currUser);
        },
        itemCount: comments.length,
      ),
    );
  }
}
