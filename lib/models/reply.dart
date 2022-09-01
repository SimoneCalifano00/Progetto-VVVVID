import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/user.dart';

class Reply {
  final String text;
  final int userCommentingId;
  final DateTime date;
  final List<int> idLikes;
  Reply? replies;

  Reply(
      {required this.text,
      required this.date,
      required this.userCommentingId,
      required this.idLikes,
      this.replies});
}
