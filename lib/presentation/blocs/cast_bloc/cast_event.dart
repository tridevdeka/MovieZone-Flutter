part of 'cast_bloc.dart';


abstract class CastEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class CastLoadEvent extends CastEvent {
  final int movieId;

  CastLoadEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
