part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselInitialEvent extends MovieCarouselEvent {
  final int defaultIndex;
  const CarouselInitialEvent({this.defaultIndex = 0});
}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex = 0});

  @override
  List<Object> get props => [defaultIndex];
}
