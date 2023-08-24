part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackDropChangedState extends MovieBackdropState {
  final MovieEntity movieEntity;

  MovieBackDropChangedState(this.movieEntity);

  @override
  List<Object?> get props => [movieEntity];
}
