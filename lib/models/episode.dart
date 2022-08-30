import 'package:new_vvvvid/models/comment.dart';

class Episode {
  final String title;
  final int nEpisode;
  List<Comment>? comments;

  Episode({required this.title, required this.nEpisode, this.comments});
}
