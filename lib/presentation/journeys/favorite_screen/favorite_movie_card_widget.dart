import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/data/core/api_constants.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_screen.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MovieDetailScreen(
                  movieDetailsArguments: MovieDetailsArguments(movie.id!),
                );
              },
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_URL_IMAGE}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<FavoriteMoviesBloc>(context).add(FavoriteMovieDeleteEvent(movie.id!));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_12.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
