part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoadingState extends SearchMovieState {}

class SearchMovieLoadedState extends SearchMovieState {
  final List<MovieEntity> movies;

  SearchMovieLoadedState(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchMovieErrorState extends SearchMovieState {
  final AppErrorType errorType;

  SearchMovieErrorState(this.errorType);

  @override
  List<Object> get props => [errorType];
}
