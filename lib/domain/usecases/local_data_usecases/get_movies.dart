import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/domain/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/no_params.dart';
import 'package:tmdb_movies_flutter/domain/usecases/usecase.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>?, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>?>> call(NoParams params) async {
    return movieRepository.getFavoriteMovies();
  }
}
