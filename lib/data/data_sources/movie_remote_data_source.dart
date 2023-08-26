import 'dart:developer';

import 'package:tmdb_movies_flutter/data/core/api_client.dart';
import 'package:tmdb_movies_flutter/data/models/movie_detail/movie_detail_model.dart';

import '../models/home/movies_result_model.dart';
import '../models/home/results.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();

  Future<List<MovieModel>> getPopular();

  Future<List<MovieModel>> getPlayingNow();

  Future<List<MovieModel>> getComingSoon();

  Future<MovieDetailModel> getMovieDetails(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final responseBody = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(responseBody).results;
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final responseBody = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(responseBody).results;
    return movies!;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final responseBody = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(responseBody).results;
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final responseBody = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(responseBody).results;
    return movies!;
  }

  @override
  Future<MovieDetailModel> getMovieDetails(int id) async {
    final responseBody = await _client.get('movie/$id');
    final movieDetail = MovieDetailModel.fromJson(responseBody);
    return movieDetail;
  }
}
