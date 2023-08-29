import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/domain/entities/cast_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/video_entity.dart';

import '../entities/app_error.dart';
import '../entities/movie_details_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>?>> getTrending();

  Future<Either<AppError, List<MovieEntity>?>> getPopular();

  Future<Either<AppError, List<MovieEntity>?>> getPlayingNow();

  Future<Either<AppError, List<MovieEntity>?>> getComingSoon();

  Future<Either<AppError, MovieDetailEntity?>> getMovieDetail(int id);

  Future<Either<AppError, List<CastEntity>?>> getCasts(int id);

  Future<Either<AppError, List<VideoEntity>?>> getVideos(int id);

  Future<Either<AppError, List<MovieEntity>?>> getSearchedMovies(String searchKeyword);


  //Database operations
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);

  Future<Either<AppError, List<MovieEntity>?>> getFavoriteMovies();

  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);

  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);
}
