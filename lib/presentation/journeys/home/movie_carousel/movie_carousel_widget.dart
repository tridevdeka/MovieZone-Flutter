import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/movie_app_bar.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../widgets/separator.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({super.key, required this.movies, required this.defaultIndex})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      MovieBackdropWidget(),
      Column(
        children: [
          MovieAppBar(),
          MoviePageView(
            movies: movies,
            initialPage: defaultIndex,
          ),
          MovieDataWidget(),
          Separator()
        ],
      ),
    ]);
  }
}
