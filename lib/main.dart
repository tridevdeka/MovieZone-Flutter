import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tmdb_movies_flutter/data/core/api_client.dart';
import 'package:tmdb_movies_flutter/data/data_sources/movie_remote_data_source.dart';
import 'package:tmdb_movies_flutter/data/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/data/repositories/movie_repository_impl.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_trending.dart';

void main() {
  ApiClient apiClient = ApiClient(Client());

  MovieRemoteDataSource remoteDataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(remoteDataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  getTrending();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
