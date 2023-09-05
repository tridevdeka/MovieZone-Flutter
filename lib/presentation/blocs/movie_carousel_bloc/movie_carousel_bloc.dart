import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';
import '../loading/loading_bloc.dart';
import '../movie_backdrop_bloc/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;
  final LoadingBloc loadingBloc;

  MovieCarouselBloc({required this.loadingBloc, required this.getTrending,required this.movieBackdropBloc}) : super(MovieCarouselInitial()) {
    on<CarouselInitialEvent>(_movieCarouselInitial);
  }

  FutureOr<void> _movieCarouselInitial(CarouselInitialEvent event, Emitter<MovieCarouselState> emit) async {
    loadingBloc.add(StartLoadingEvent());
    await Future.delayed(Duration(seconds: 2));
    emit(MovieCarouselLoadingState());
    final moviesEither = await getTrending(NoParams());
    emit(moviesEither.fold((l) {
      return MovieCarouselError(l.appErrorType);
    }, (movies) {
      movieBackdropBloc.add(MovieBackdropChangedEvent(movies![event.defaultIndex]));
      return MovieCarouselLoaded(
        movies: movies,
        defaultIndex: event.defaultIndex,
      );
    }));

    loadingBloc.add(FinishLoadingEvent());

  }
}
