import 'package:new_vvvvid/models/user.dart';

class Comment {
  final int creatorId;
  int? likes;
  final String text;
  List<Comment>? replies;

  Comment({
    required this.creatorId,
    required this.text,
    this.likes,
    this.replies,
  });
}
