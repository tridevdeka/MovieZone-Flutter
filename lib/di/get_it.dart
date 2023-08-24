import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/usecases/get_coming_soon_.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance
    ..registerLazySingleton<Client>(() => Client())
    ..registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()))
    ..registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()))
    ..registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()))
    ..registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()))
    ..registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()))
    ..registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()))
    ..registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()))
    ..registerFactory(() => MovieBackdropBloc())
    ..registerFactory(() => MovieCarouselBloc(getItInstance(), getTrending: getItInstance()));
}
