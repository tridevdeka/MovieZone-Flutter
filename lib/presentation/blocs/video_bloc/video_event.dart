part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class VideoLoadedEvent extends VideoEvent {
  final int movieId;

  VideoLoadedEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
