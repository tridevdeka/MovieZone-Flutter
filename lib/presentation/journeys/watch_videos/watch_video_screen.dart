import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/domain/entities/video_entity.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/watch_videos/watch_videos_arguments.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideosArguments watchVideosArguments;

  const WatchVideoScreen({super.key, required this.watchVideosArguments});

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late final List<VideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideosArguments.videos;
    _controller = YoutubePlayerController(
        initialVideoId: _videos[0].key!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstant.watchTrailers.t(context)!,
        ),
      ),
      body: YoutubePlayerBuilder(
        onEnterFullScreen: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
            SystemUiOverlay.top,
          ]);
        },
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(playedColor: Colors.amber, handleColor: Colors.amberAccent),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i < _videos.length; i++)
                      Container(
                        height: Sizes.dimen_60.h,
                        padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller.load(_videos[i].key!);
                                _controller.play();
                              },
                              child: CachedNetworkImage(
                                width: Sizes.dimen_200.w,
                                imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key!, quality: ThumbnailQuality.high),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              _videos[i].title!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ))
                          ],
                        ),
                      ),
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
