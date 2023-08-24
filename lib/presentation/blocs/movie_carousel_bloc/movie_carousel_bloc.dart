import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';
import '../movie_backdrop_bloc/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(this.movieBackdropBloc, {required this.getTrending}) : super(MovieCarouselInitial()) {
    on<CarouselInitialEvent>(_movieCarouselInitial);
  }

  FutureOr<void> _movieCarouselInitial(CarouselInitialEvent event, Emitter<MovieCarouselState> emit) async {
    emit(MovieCarouselLoadingState());
    final moviesEither = await getTrending(NoParams());
    emit(MovieCarouselLoaded(
        movies: moviesEither.fold((l) {
      emit(MovieCarouselError());
      return null;
    }, (movies) {
          movieBackdropBloc.add(MovieBackdropChangedEvent(movies![event.defaultIndex]));
      MovieCarouselLoaded(
        movies: movies,
        defaultIndex: event.defaultIndex,
      );
      return movies;
    })));
  }
}
