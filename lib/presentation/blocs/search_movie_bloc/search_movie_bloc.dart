import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_search_params.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_search_movies.dart';
import '../loading/loading_bloc.dart';

part 'search_movie_event.dart';

part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchedMovies getSearchedMovies;
  final LoadingBloc loadingBloc;


  SearchMovieBloc({required this.loadingBloc,required this.getSearchedMovies}) : super(SearchMovieInitial()) {
    on<SearchMovieLoadEvent>(_searchMovieLoadEvent);
  }

  FutureOr<void> _searchMovieLoadEvent(SearchMovieLoadEvent event, Emitter<SearchMovieState> emit) async {
    if (event.searchKeyWord?.isNotEmpty == true && event.searchKeyWord!.length > 2) {
      emit(SearchMovieLoadingState());
      final moviesEither = await getSearchedMovies(MovieSearchParams(searchTerm: event.searchKeyWord ?? ""));
      emit(moviesEither.fold((l) => SearchMovieErrorState(l.appErrorType), (r) => SearchMovieLoadedState(r!)));
    }
  }
}
