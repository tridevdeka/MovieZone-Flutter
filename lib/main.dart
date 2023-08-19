import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tmdb_movies_flutter/data/core/api_client.dart';
import 'package:tmdb_movies_flutter/data/data_sources/movie_remote_data_source.dart';

void main() {
  ApiClient apiClient=ApiClient(Client());
  MovieRemoteDataSourceImpl dataSource = MovieRemoteDataSourceImpl(apiClient);
  dataSource.getTrending();
  dataSource.getPopular();
  dataSource.getComingSoon();
  dataSource.getPlayingNow();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
