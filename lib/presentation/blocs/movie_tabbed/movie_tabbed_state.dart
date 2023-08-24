part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabbedIndex;

  const MovieTabbedState(this.currentTabbedIndex);

  @override
  List<Object> get props => [currentTabbedIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  const MovieTabbedInitial(super.currentTabbedIndex);
}

class MovieTabbedChangedState extends MovieTabbedState {
  final List<MovieEntity>? movies;

  const MovieTabbedChangedState(super.currentTabbedIndex, {required this.movies});

  @override
  List<Object> get props => [currentTabbedIndex, movies!];
}

class MovieTabbedLoadErrorState extends MovieTabbedState {
  const MovieTabbedLoadErrorState(super.currentTabbedIndex);

  @override
  List<Object> get props => [currentTabbedIndex];
}
