import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

import '../../../../domain/entities/movie_entity.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: movies.length,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: Sizes.dimen_14.w,
          );
        },
        itemBuilder: (context, index) {
          final MovieEntity movieEntity = movies[index];
          return MovieTabCardWidget(
            movieId: movieEntity.id!,
            title: movieEntity.title!,
            posterPath: movieEntity.posterPath!,
          );
        },
      ),
    );
  }
}
