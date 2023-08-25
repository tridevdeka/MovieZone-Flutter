import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/movie_app_bar.dart';

import '../../../../common/constants/translation_constants.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../widgets/separator.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity>? movies;
  final int defaultIndex;

  const MovieCarouselWidget({super.key, required this.movies, required this.defaultIndex})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      movies?.isEmpty ?? true ? SizedBox.shrink() : MovieBackdropWidget(),
      Column(
        children: [
          MovieAppBar(),
          movies?.isEmpty ?? true
              ? Expanded(
                  child: Center(
                      child: Text(
                  TranslationConstant.noMovies.t(context)!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                )))
              : MoviePageView(
                  movies: movies!,
                  initialPage: defaultIndex,
                ),
          movies?.isEmpty ?? true ? SizedBox.shrink() : MovieDataWidget(),
          movies?.isEmpty ?? true ? SizedBox.shrink() : Separator()
        ],
      ),
    ]);
  }
}
