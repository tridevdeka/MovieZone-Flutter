import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';

import '../../../domain/entities/video_entity.dart';
import '../../../domain/usecases/get_videos.dart';

part 'video_event.dart';

part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {

  final GetVideos getVideos;

  VideoBloc(this.getVideos) : super(VideoInitial()) {
    on<VideoLoadedEvent>(_videoLoadedEvent);
  }

  FutureOr<void> _videoLoadedEvent(VideoLoadedEvent event, Emitter<VideoState> emit) async{
    emit(VideoLoadingState());
    final videosEither=await getVideos(MovieParams(id: event.movieId));
    emit(videosEither.fold((l) => VideoLoadedError(l.appErrorType), (r) => VideoLoadedState(r!)));
  }
}
