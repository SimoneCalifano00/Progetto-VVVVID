import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/dummy_users.dart';
import 'package:new_vvvvid/models/user.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    User commentUser =
        DUMMY_USERS.firstWhere((user) => user.id == comment.creatorId);

    final _displayHeight = MediaQuery.of(context).size.height;
    final _displayWidth = MediaQuery.of(context).size.width;

    return ListTile(
      title: Text(commentUser.username,
          style: Theme.of(context).textTheme.bodyText1),
      subtitle:
          Text(comment.text, style: Theme.of(context).textTheme.bodyText2),
      leading: CircleAvatar(
          foregroundImage: NetworkImage(commentUser.profilePicUrl),
          backgroundColor: Colors.grey,
          radius: _displayWidth * 0.08),
    );
  }
}
