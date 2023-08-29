part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoriteMoviesInitial extends FavoriteMoviesState {}

class FavoriteMovieLoadedState extends FavoriteMoviesState {
  final List<MovieEntity> favoriteMovies;

  FavoriteMovieLoadedState(this.favoriteMovies);

  @override
  List<Object> get props => [favoriteMovies];
}

class IsFavoriteMovieState extends FavoriteMoviesState {
  final bool isFavoriteMovie;

  IsFavoriteMovieState(this.isFavoriteMovie);

  @override
  List<Object> get props => [isFavoriteMovie];
}

class FavoriteMoviesErrorState extends FavoriteMoviesState {
  final AppErrorType errorType;

  FavoriteMoviesErrorState(this.errorType);

  @override
  List<Object> get props => [errorType];
}


