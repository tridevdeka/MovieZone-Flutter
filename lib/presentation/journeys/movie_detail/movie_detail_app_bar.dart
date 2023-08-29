import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_details_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({super.key, required this.movieDetailEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(builder: (context, state) {
          if (state is IsFavoriteMovieState) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<FavoriteMoviesBloc>(context).add(FavoriteMovieToggleEvent(
                    state.isFavoriteMovie, MovieEntity.fromMovieDetailEntity(movieDetailEntity)));
              },
              child: Icon(
                state.isFavoriteMovie ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
            );
          } else {
            return Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            );
          }
        }),
      ],
    );
  }
}
