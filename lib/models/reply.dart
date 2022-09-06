import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/user.dart';

class Reply {
  final String text;
  final int userCommentingId;
  final DateTime date;
  final List<int> idLikes;
  int likes = 0;
  List<Reply>? replies;

  Reply(
      {required this.text,
      required this.date,
      required this.userCommentingId,
      required this.idLikes,
      required this.likes,
      this.replies});
}
