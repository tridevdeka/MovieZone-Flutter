import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselBloc({required this.getTrending}) : super(MovieCarouselInitial()) {
    on<CarouselInitialEvent>(_movieCarouselInitial);
  }

  FutureOr<void> _movieCarouselInitial(CarouselInitialEvent event, Emitter<MovieCarouselState> emit) async {
    emit(MovieCarouselLoadingState());
    await Future.delayed(Duration(seconds: 1));
    final moviesEither = await getTrending(NoParams());
    emit(MovieCarouselLoaded(
        movies: moviesEither.fold((l) {
      emit(MovieCarouselError());
      return null;
    }, (movies) {
      MovieCarouselLoaded(
        movies: movies,
        defaultIndex: event.defaultIndex,
      );
      return movies;
    })));
  }

/*@override
  Stream<MovieCarouselState> mapEventToState(
      MovieCarouselEvent event,
      ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
            (l) => MovieCarouselError(),
            (movies) {
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }*/
}
