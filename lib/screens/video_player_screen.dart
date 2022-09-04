import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vvvvid/models/products.dart';
import 'package:new_vvvvid/models/user.dart';
import 'package:new_vvvvid/widgets/video_player_widget.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen(this.currUser, this.productTitle,
      this.productEpisodeTitle, this.productNEpisode);

  final User currUser;
  final String productEpisodeTitle;
  final String productTitle;
  final int productNEpisode;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(widget.currUser, widget.productTitle,
        widget.productEpisodeTitle, widget.productNEpisode);
  }
}
