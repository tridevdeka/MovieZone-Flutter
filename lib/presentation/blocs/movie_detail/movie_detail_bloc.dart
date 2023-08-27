import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';

import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/usecases/get_movie_details.dart';
import '../cast_bloc/cast_bloc.dart';
import '../video_bloc/video_bloc.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideoBloc videoBloc;

  MovieDetailBloc({required this.videoBloc,required this.getMovieDetail, required this.castBloc}) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>(_movieDetailLoadEvent);
  }

  FutureOr<void> _movieDetailLoadEvent(MovieDetailLoadEvent event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoadingState());
    final movieEither = await getMovieDetail(MovieParams(id: event.movieId));
    emit(movieEither.fold((l) => MovieDetailError(l.appErrorType), (r) => MovieDetailLoadedState(r!)));

    castBloc.add(CastLoadEvent(movieId: event.movieId));
    videoBloc.add(VideoLoadedEvent(movieId:event.movieId));
  }
}
