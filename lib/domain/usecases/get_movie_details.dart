import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/data/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';
import 'package:tmdb_movies_flutter/domain/usecases/usecase.dart';

import '../entities/movie_details_entity.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity?, MovieParams> {
  final MovieRepository movieRepository;

  GetMovieDetail(this.movieRepository);

  @override
  Future<Either<AppError, MovieDetailEntity?>> call(MovieParams params) async {
    return await movieRepository.getMovieDetail(params.id);
  }
}
