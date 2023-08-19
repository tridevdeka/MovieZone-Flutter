import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>?> getTrending();

  Future<List<MovieEntity>?> getPopular();

  Future<List<MovieEntity>?> getPlayingNow();

  Future<List<MovieEntity>?> getComingSoon();
}
