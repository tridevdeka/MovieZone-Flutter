import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/data/models/credits/cast.dart';
import 'package:tmdb_movies_flutter/data/models/trailers/results.dart';
import 'package:tmdb_movies_flutter/domain/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/cast_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';
import 'package:tmdb_movies_flutter/domain/entities/video_entity.dart';
import 'package:tmdb_movies_flutter/domain/usecases/usecase.dart';

import '../entities/movie_details_entity.dart';
import '../entities/movie_search_params.dart';

class GetSearchedMovies extends UseCase<List<MovieEntity>?, MovieSearchParams> {
  final MovieRepository movieRepository;

  GetSearchedMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>?>> call(MovieSearchParams params) async {
    return await movieRepository.getSearchedMovies(params.searchTerm);
  }
}
