import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';

part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropChangedEvent>(_movieBackdropChangedEvent);
  }

  FutureOr<void> _movieBackdropChangedEvent(MovieBackdropChangedEvent event, Emitter<MovieBackdropState> emit) {
    emit(MovieBackDropChangedState(event.movieEntity));
  }

}
