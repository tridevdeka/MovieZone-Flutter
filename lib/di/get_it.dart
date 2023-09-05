import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tmdb_movies_flutter/data/data_sources/language_local_data_source.dart';
import 'package:tmdb_movies_flutter/data/repositories/app_repository_impl.dart';
import 'package:tmdb_movies_flutter/domain/repositories/app_repository.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_casts.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_movie_details.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_search_movies.dart';
import 'package:tmdb_movies_flutter/domain/usecases/get_videos.dart';
import 'package:tmdb_movies_flutter/domain/usecases/local_data_usecases/check_if_favorite_movie.dart';
import 'package:tmdb_movies_flutter/domain/usecases/local_data_usecases/get_movies.dart';
import 'package:tmdb_movies_flutter/domain/usecases/local_data_usecases/get_preferred_language.dart';
import 'package:tmdb_movies_flutter/domain/usecases/local_data_usecases/save_movie.dart';
import 'package:tmdb_movies_flutter/domain/usecases/local_data_usecases/update_language.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/language_bloc/language_bloc/language_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/loading/loading_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/search_movie_bloc/search_movie_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/video_bloc/video_bloc.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/movie_local_data_source.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../domain/repositories/movie_repository.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/usecases/get_coming_soon_.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/local_data_usecases/delete_movie.dart';
import '../presentation/blocs/cast_bloc/cast_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance
    ..registerLazySingleton<Client>(() => Client())
    ..registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()))
    ..registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()))
    ..registerLazySingleton<LanguageLocalDatSource>(() => LanguageLocalDatSourceImpl())
    ..registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl())
    ..registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()))
    ..registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()))
    ..registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()))
    ..registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()))
    ..registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()))
    ..registerLazySingleton<GetCasts>(() => GetCasts(getItInstance()))
    ..registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()))
    ..registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()))
    ..registerLazySingleton<GetFavoriteMovies>(() => GetFavoriteMovies(getItInstance()))
    ..registerLazySingleton<DeleteFavoriteMovie>(() => DeleteFavoriteMovie(getItInstance()))
    ..registerLazySingleton<CheckIfFavoriteMovie>(() => CheckIfFavoriteMovie(getItInstance()))
    ..registerLazySingleton<GetSearchedMovies>(() => GetSearchedMovies(getItInstance()))
    ..registerLazySingleton<GetPreferredLanguage>(() => GetPreferredLanguage(getItInstance()))
    ..registerLazySingleton<UpdateLanguage>(() => UpdateLanguage(getItInstance()))
    ..registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance(), getItInstance()))
    ..registerLazySingleton<AppRepository>(() => AppRepositoryImpl(getItInstance()))
    ..registerFactory(() => MovieBackdropBloc())
    ..registerFactory(() => FavoriteMoviesBloc(
        loadingBloc: getItInstance(),
        saveMovie: getItInstance(),
        getFavoriteMovies: getItInstance(),
        deleteFavoriteMovie: getItInstance(),
        checkIfFavoriteMovie: getItInstance()))
    ..registerFactory(() => MovieDetailBloc(
        loadingBloc: getItInstance(),
        getMovieDetail: getItInstance(),
        castBloc: getItInstance(),
        videoBloc: getItInstance(),
        favoriteMovieBloc: getItInstance()))
    ..registerFactory(() => CastBloc(getItInstance()))
    ..registerFactory(() => VideoBloc(getItInstance()))
    ..registerFactory(() => SearchMovieBloc(loadingBloc: getItInstance(), getSearchedMovies: getItInstance()))
    ..registerFactory(() => MovieCarouselBloc(
        loadingBloc: getItInstance(), movieBackdropBloc: getItInstance(), getTrending: getItInstance()))
    ..registerFactory(() =>
        MovieTabbedBloc(getPopular: getItInstance(), getPlayingNow: getItInstance(), getComingSoon: getItInstance()))
    ..registerSingleton(LanguageBloc(getPreferredLanguage: getItInstance(), updateLanguage: getItInstance()))
    ..registerSingleton(LoadingBloc());
}
