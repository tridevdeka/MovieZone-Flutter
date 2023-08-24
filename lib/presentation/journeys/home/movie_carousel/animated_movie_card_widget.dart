import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/screenutil/screenutil.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidget(
      {super.key, required this.index, required this.movieId, required this.posterPath, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (BuildContext context, Widget? child) {
          double value = 1;
          //Scroll change listener
          if (pageController.position.hasContentDimensions) {
            value = pageController.page! - index;
            value = (1 - value.abs() * 0.1).clamp(0.0, 1.0);
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: Sizes.dimen_230.w,
                height: Curves.easeIn.transform(value) * ScreenUtil.screenHeight * 0.35,
                child: child,
              ),
            );
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: Curves.easeIn.transform(index==0?value:value*0.5)*ScreenUtil.screenHeight*0.35,
                width: Sizes.dimen_230.w,
                child: child,
              ),
            );
          }
        },
        child: MovieCardWidget(movieId: movieId, posterPath: posterPath));
  }
}
