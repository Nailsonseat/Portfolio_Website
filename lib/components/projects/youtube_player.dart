import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Youtube extends StatelessWidget {
  Youtube({super.key, required this.videoLink});

  final String videoLink;

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
