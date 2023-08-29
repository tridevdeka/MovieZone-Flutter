import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/di/get_it.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/favorite_movies/favorite_movies_bloc.dart';

import '../../../common/constants/translation_constants.dart';
import 'favorite_movies_grid_view_widget.dart';

class FavoriteMovieScreen extends StatefulWidget {
  const FavoriteMovieScreen({super.key});

  @override
  State<FavoriteMovieScreen> createState() => _FavoriteMovieScreenState();
}

class _FavoriteMovieScreenState extends State<FavoriteMovieScreen> {
  late FavoriteMoviesBloc _favoriteMoviesBloc;

  @override
  void initState() {
    super.initState();
    _favoriteMoviesBloc = getItInstance<FavoriteMoviesBloc>();
    _favoriteMoviesBloc.add(FavoriteMoviesLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _favoriteMoviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationConstant.favoriteMovies.t(context)!),
      ),
      body: BlocProvider.value(
        value: _favoriteMoviesBloc,
        child: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
          builder: (context, state) {
            if (state is FavoriteMovieLoadedState) {
              if (state.favoriteMovies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConstant.noFavoriteMovie.t(context)!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              } else {
                return FavoriteMovieGridView(
                  movies: state.favoriteMovies,
                );
              }
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
