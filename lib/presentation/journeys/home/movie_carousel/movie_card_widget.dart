import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/data/core/api_constants.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_screen.dart';

import '../../../../common/constants/route_constants.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({super.key, required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      elevation: 32,
      child: GestureDetector(
        onTap: () {

          Navigator.of(context).pushNamed(RouteList.movieDetail,arguments:MovieDetailsArguments(movieId));


          /*Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return MovieDetailScreen(
              movieDetailsArguments: MovieDetailsArguments(movieId),
            );
          }));*/
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_URL_IMAGE}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
