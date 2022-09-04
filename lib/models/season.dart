import 'package:new_vvvvid/models/comment.dart';
import 'package:new_vvvvid/models/episode.dart';

class Season {
  final int sNumber;
  final int nEpisodes;
  final List<Episode> episodes;
  final String productTitle;

  Season(
      {required this.sNumber,
      required this.nEpisodes,
      required this.episodes,
      required this.productTitle});
}
