import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/watch_videos/watch_video_screen.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/watch_videos/watch_videos_arguments.dart';

import '../../../common/constants/route_constants.dart';
import '../../widgets/button.dart';
import '../video_bloc/video_bloc.dart';

class VideosWidget extends StatelessWidget {
  final VideoBloc videoBloc;

  const VideosWidget({super.key, required this.videoBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: videoBloc,
        builder: (context, state) {
          if (state is VideoLoadedState && state.videos.iterator.moveNext()) {
            return Button(
              text: TranslationConstant.watchTrailers,
              onPressed: () {

                Navigator.of(context).pushNamed(RouteList.watchTrailer,arguments:WatchVideosArguments(state.videos));


                /*Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => WatchVideoScreen(watchVideosArguments: WatchVideosArguments(state.videos))),
                );*/
              },
            );
          } else if (state is VideoLoadedError) {
            return Container();
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
