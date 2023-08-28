import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_casts.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_movie_details.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_search_movies.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_videos.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/language_bloc/language_bloc/language_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/search_movie_bloc/search_movie_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/video_bloc/video_bloc.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/usecases/get_coming_soon_.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../presentation/blocs/cast_bloc/cast_bloc.dart';

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
    ..registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()))
    ..registerLazySingleton<GetCasts>(() => GetCasts(getItInstance()))
    ..registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()))
    ..registerLazySingleton<GetSearchedMovies>(() => GetSearchedMovies(getItInstance()))
    ..registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()))
    ..registerFactory(() => MovieBackdropBloc())
    ..registerFactory(
        () => MovieDetailBloc(getMovieDetail: getItInstance(), castBloc: getItInstance(), videoBloc: getItInstance()))
    ..registerFactory(() => CastBloc(getItInstance()))
    ..registerFactory(() => VideoBloc(getItInstance()))
    ..registerFactory(() => SearchMovieBloc(getSearchedMovies: getItInstance()))
    ..registerFactory(() => MovieCarouselBloc(getItInstance(), getTrending: getItInstance()))
    ..registerFactory(() =>
        MovieTabbedBloc(getPopular: getItInstance(), getPlayingNow: getItInstance(), getComingSoon: getItInstance()))
    ..registerSingleton(LanguageBloc());
}
