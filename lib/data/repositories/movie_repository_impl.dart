import 'package:tmdb_movies_flutter/data/data_sources/movie_remote_data_source.dart';
import 'package:tmdb_movies_flutter/data/models/results.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';

import 'movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieModel>?> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return movies;
    } on Exception {
      return null;
    }
  }

  @override
  Future<List<MovieEntity>?> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return movies;
    } on Exception {
      return null;
    }
  }

  @override
  Future<List<MovieEntity>?> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return movies;
    } on Exception {
      return null;
    }
  }

  @override
  Future<List<MovieEntity>?> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return movies;
    } on Exception {
      return null;
    }
  }
}
