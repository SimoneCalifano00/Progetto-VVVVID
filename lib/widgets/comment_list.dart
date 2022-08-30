import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/widgets/comment_item.dart';

class CommentList extends StatelessWidget {
  final List<Comment> comments;
  const CommentList(this.comments);

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _displayHeight * 0.4,
      width: _displayWidth * 0.85,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemExtent: _displayHeight * 0.12,
        itemBuilder: (context, index) {
          return CommentItem(comments[index]);
        },
        itemCount: comments.length,
      ),
    );
  }
}
