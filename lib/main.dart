import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tmdb_movies_flutter/data/core/api_client.dart';
import 'package:tmdb_movies_flutter/data/data_sources/movie_remote_data_source.dart';
import 'package:tmdb_movies_flutter/data/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/data/repositories/movie_repository_impl.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/no_params.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_trending.dart';

Future<void> main() async {
  ApiClient apiClient = ApiClient(Client());

  MovieRemoteDataSource remoteDataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(remoteDataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>?> eitherResponse =
      await getTrending(NoParams());

  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of movies');
    print(r);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
