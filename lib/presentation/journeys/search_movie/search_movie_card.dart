import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/data/core/api_constants.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_text.dart';

import '../../../domain/entities/movie_entity.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MovieDetailScreen(
            movieDetailsArguments: MovieDetailsArguments(movie.id!),
          ),
        ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_2.h,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_URL_IMAGE}${movie.posterPath}',
                  width: Sizes.dimen_80.w,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    movie.overview!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}