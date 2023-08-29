part of 'favorite_movies_bloc.dart';

abstract class FavoriteMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class FavoriteMoviesLoadEvent extends FavoriteMoviesEvent {
}

class FavoriteMovieDeleteEvent extends FavoriteMoviesEvent {
  final int id;


  FavoriteMovieDeleteEvent(this.id);

  @override
  List<Object> get props => [id];
}

class FavoriteMovieToggleEvent extends FavoriteMoviesEvent {
  final MovieEntity movie;
  final bool isFavorite;

  FavoriteMovieToggleEvent(this.isFavorite, this.movie);

  @override
  List<Object> get props => [isFavorite, movie];
}

class FavoriteMovieCheckEvent extends FavoriteMoviesEvent {
  final int id;

  FavoriteMovieCheckEvent(this.id);

  @override
  List<Object> get props => [id];
}
