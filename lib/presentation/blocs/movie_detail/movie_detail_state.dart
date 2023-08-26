part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoadingState extends MovieDetailState {}

class MovieDetailLoadedState extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailLoadedState(this.movieDetailEntity);

  @override
  List<Object> get props => [movieDetailEntity];
}

class MovieDetailError extends MovieDetailState {
  final AppErrorType errorType;

  const MovieDetailError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
