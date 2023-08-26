import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/di/get_it.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import 'big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailsArguments movieDetailsArguments;

  const MovieDetailScreen({super.key, required this.movieDetailsArguments});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _movieDetailBloc.add(
      MovieDetailLoadEvent(widget.movieDetailsArguments.movieId),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _movieDetailBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>.value(
        value: _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoadingState) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailLoadedState) {
              final movieDetail = state.movieDetailEntity;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigPoster(
                    movieDetail: movieDetail,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_16.w,
                    ),
                    child: Text(
                      movieDetail.overview!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              );
            } else if (state is MovieDetailError) {
              return Container();
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
