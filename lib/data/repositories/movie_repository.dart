import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';

import '../../domain/entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>?>> getTrending();

  Future<Either<AppError, List<MovieEntity>?>> getPopular();

  Future<Either<AppError, List<MovieEntity>?>> getPlayingNow();

  Future<Either<AppError, List<MovieEntity>?>> getComingSoon();
}
