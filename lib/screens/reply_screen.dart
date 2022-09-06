import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/reply.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/appbarAndScreenViewer.dart';
import 'package:new_vvvvid/widgets/replies.dart';

class ReplyScreen extends StatelessWidget {
  const ReplyScreen(this.comment, this.currUser);

  final Comment comment;
  final User currUser;

  @override
  Widget build(BuildContext context) {
    return AppbarAndScreen(RepliesWidget(comment, currUser), currUser);
  }
}
