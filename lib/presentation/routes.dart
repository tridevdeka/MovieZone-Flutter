import 'package:flutter/cupertino.dart';
import 'package:tmdb_movies_flutter/common/constants/route_constants.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/favorite_screen/favorite_screen.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/home_screen.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/watch_videos/watch_video_screen.dart';

import 'journeys/watch_videos/watch_videos_arguments.dart';

class Routes {

  static Map<String,WidgetBuilder> getRoutes(RouteSettings settings)=>{
    RouteList.initial:(context)=>HomeScreen(),
    RouteList.movieDetail:(context)=>MovieDetailScreen(movieDetailsArguments: settings.arguments as MovieDetailsArguments),
    RouteList.watchTrailer:(context)=>WatchVideoScreen(watchVideosArguments: settings.arguments as WatchVideosArguments),
    RouteList.favoriteScreen:(context)=>FavoriteMovieScreen()

  };
}
