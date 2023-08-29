import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';
import 'package:tmdb_movies_flutter/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/local_data_usecases/check_if_favorite_movie.dart';
import '../../../domain/usecases/local_data_usecases/delete_movie.dart';
import '../../../domain/usecases/local_data_usecases/get_movies.dart';
import '../../../domain/usecases/local_data_usecases/save_movie.dart';

part 'favorite_movies_event.dart';

part 'favorite_movies_state.dart';

class FavoriteMoviesBloc extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;

  FavoriteMoviesBloc(
      {required this.saveMovie,
      required this.getFavoriteMovies,
      required this.deleteFavoriteMovie,
      required this.checkIfFavoriteMovie})
      : super(FavoriteMoviesInitial()) {

    on<FavoriteMovieToggleEvent>(_favoriteMovieToggleEvent);
    on<FavoriteMoviesLoadEvent>(_favoriteMoviesLoadEvent);
    on<FavoriteMovieDeleteEvent>(_favoriteMovieDeleteEvent);
    on<FavoriteMovieCheckEvent>(_favoriteMovieCheckEvent);
  }

  FutureOr<void> _favoriteMoviesLoadEvent(FavoriteMoviesLoadEvent event, Emitter<FavoriteMoviesState> emit) async {
    final moviesEither = await getFavoriteMovies(NoParams());
    emit(moviesEither.fold((l) => FavoriteMoviesErrorState(l.appErrorType), (r) => FavoriteMovieLoadedState(r!)));
  }

  FutureOr<void> _favoriteMovieToggleEvent(FavoriteMovieToggleEvent event, Emitter<FavoriteMoviesState> emit) async {
    if (event.isFavorite) {
      await deleteFavoriteMovie(MovieParams(id: event.movie.id!));
    } else {
      await saveMovie(event.movie);
    }
    final response = await checkIfFavoriteMovie(MovieParams(id: event.movie.id!));
    emit(response.fold((l) => FavoriteMoviesErrorState(l.appErrorType), (r) => IsFavoriteMovieState(r)));
  }

  FutureOr<void> _favoriteMovieDeleteEvent(FavoriteMovieDeleteEvent event, Emitter<FavoriteMoviesState> emit) async {
    await deleteFavoriteMovie(MovieParams(id: event.id));
    add(FavoriteMoviesLoadEvent());
    // emit(response.fold((l) => FavoriteMoviesErrorState(l.appErrorType), (r) => FavoriteMovieLoadedState(const [])));

    /*final moviesEither = await getFavoriteMovies(NoParams());
    emit(moviesEither.fold((l) => FavoriteMoviesErrorState(l.appErrorType), (r) => FavoriteMovieLoadedState(r!)));*/
  }

  FutureOr<void> _favoriteMovieCheckEvent(FavoriteMovieCheckEvent event, Emitter<FavoriteMoviesState> emit) async {
    final response = await checkIfFavoriteMovie(MovieParams(id: event.id));
    emit(response.fold((l) => FavoriteMoviesErrorState(l.appErrorType), (r) => IsFavoriteMovieState(r)));
  }
}
