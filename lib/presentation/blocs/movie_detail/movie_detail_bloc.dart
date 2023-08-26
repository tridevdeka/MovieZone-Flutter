import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';

import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/usecases/get_movie_details.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc(this.getMovieDetail) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>(_movieDetailLoadEvent);
  }

  FutureOr<void> _movieDetailLoadEvent(MovieDetailLoadEvent event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoadingState());
    final movieEither = await getMovieDetail(MovieParams(id: event.movieId));
    emit(movieEither.fold(
        (l) => MovieDetailError(l.appErrorType), (r) => MovieDetailLoadedState(r!)));
  }
}
