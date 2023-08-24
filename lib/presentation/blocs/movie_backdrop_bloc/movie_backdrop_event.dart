part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object?> get props => [];
}

class MovieBackdropInitialEvent extends MovieBackdropEvent {}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MovieEntity movieEntity;

  const MovieBackdropChangedEvent(this.movieEntity);

  @override
  List<Object?> get props => [movieEntity];
}
