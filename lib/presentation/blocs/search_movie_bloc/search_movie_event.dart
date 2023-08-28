part of 'search_movie_bloc.dart';


abstract class SearchMovieEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class SearchMovieLoadEvent extends SearchMovieEvent {
  final String? searchKeyWord;

  SearchMovieLoadEvent({this.searchKeyWord});

  @override
  List<Object?> get props => [searchKeyWord];
}
