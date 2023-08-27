import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/data/models/credits/cast.dart';
import 'package:tmdb_movies_flutter/data/models/trailers/results.dart';
import 'package:tmdb_movies_flutter/domain/entities/cast_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/video_entity.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/entities/movie_details_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>?>> getTrending();

  Future<Either<AppError, List<MovieEntity>?>> getPopular();

  Future<Either<AppError, List<MovieEntity>?>> getPlayingNow();

  Future<Either<AppError, List<MovieEntity>?>> getComingSoon();

  Future<Either<AppError, MovieDetailEntity?>> getMovieDetail(int id);

  Future<Either<AppError, List<CastEntity>?>> getCasts(int id);

  Future<Either<AppError, List<VideoEntity>?>> getVideos(int id);

}
