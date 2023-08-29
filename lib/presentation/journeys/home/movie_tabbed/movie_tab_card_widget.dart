import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/data/core/api_constants.dart';

import '../../../../common/constants/route_constants.dart';
import '../../movie_detail/movie_detail_arguments.dart';
import '../../movie_detail/movie_detail_screen.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCardWidget({super.key, required this.movieId, required this.title, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Navigator.of(context).pushNamed(RouteList.movieDetail,arguments:MovieDetailsArguments(movieId));


        /*Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
         return MovieDetailScreen(
            movieDetailsArguments: MovieDetailsArguments(movieId),
          );
        }));*/
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_URL_IMAGE}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Text(
              title.toIntelliTrim(15),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
