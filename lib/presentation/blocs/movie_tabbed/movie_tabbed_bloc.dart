import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_coming_soon_.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';

part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({required this.getPopular, required this.getPlayingNow, required this.getComingSoon})
      : super(MovieTabbedInitial(0)) {
    on<MovieTabChangedEvent>(_movieTabChangedEvent);
  }

  FutureOr<void> _movieTabChangedEvent(MovieTabChangedEvent event, Emitter<MovieTabbedState> emit) async {
    emit(MovieTabbedLoadingState(event.currentTabIndex));
    Either<AppError, List<MovieEntity>?> moviesEither;
    switch (event.currentTabIndex) {
      case 0:
        moviesEither = await getPopular(NoParams());
      case 1:
        moviesEither = await getPlayingNow(NoParams());
      case 2:
        moviesEither = await getComingSoon(NoParams());
      default:
        moviesEither = await getPopular(NoParams());
    }
    // emit(MovieTabbedLoadErrorState(event.currentTabIndex, AppErrorType.network));
    emit(moviesEither.fold((l) {
      return MovieTabbedLoadErrorState(event.currentTabIndex, l.appErrorType);
    }, (movies) {
      return MovieTabbedChangedState(event.currentTabIndex, movies: movies);
    }));
  }
}
