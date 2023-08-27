part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoadingState extends VideoState {}

class VideoLoadedState extends VideoState {
  final List<VideoEntity> videos;

  VideoLoadedState(this.videos);

  @override
  List<Object> get props => [videos];
}

class VideoLoadedError extends VideoState {
  final AppErrorType errorType;

  VideoLoadedError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
