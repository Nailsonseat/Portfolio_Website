import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeSection extends StatelessWidget{
  YoutubeSection({super.key, required this.videoLink, required this.title});

  final String videoLink;
  final String title;

  final _controller = YoutubePlayerController(
    params: const YoutubePlayerParams(
      mute: false,
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {

    // Extract video id from link
    final String videoId = YoutubePlayerController.convertUrlToId(videoLink)!;
    _controller.cueVideoById(videoId: videoId);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: YoutubePlayer(
        controller: _controller,
      ),
    );
  }
}
