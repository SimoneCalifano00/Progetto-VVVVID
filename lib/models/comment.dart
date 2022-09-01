import 'package:new_vvvvid/models/reply.dart';
import 'package:new_vvvvid/models/user.dart';

class Comment {
  final int creatorId;
  int? likes;
  final String text;
  List<Reply>? replies;
  final DateTime date;

  List<int>? idLikes;

  Comment({
    required this.creatorId,
    required this.text,
    required this.date,
    this.likes,
    this.replies,
    this.idLikes,
  });
}
