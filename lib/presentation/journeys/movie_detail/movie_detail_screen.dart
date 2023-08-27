import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/di/get_it.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import '../../blocs/movie_detail/videos_widget.dart';
import '../../blocs/video_bloc/video_bloc.dart';
import 'big_poster.dart';
import 'cast_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailsArguments movieDetailsArguments;

  const MovieDetailScreen({super.key, required this.movieDetailsArguments});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late final CastBloc _castBloc;
  late final VideoBloc _videoBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videoBloc = _movieDetailBloc.videoBloc;
    _movieDetailBloc.add(MovieDetailLoadEvent(widget.movieDetailsArguments.movieId));
  }

  @override
  void dispose() {
    super.dispose();
    _movieDetailBloc.close();
    _castBloc.close();
    _videoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videoBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoadingState) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailLoadedState) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movieDetail: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                        vertical: Sizes.dimen_8.h,
                      ),
                      child: Text(
                        movieDetail.overview!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                      child: Text(
                        TranslationConstant.cast.t(context)!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(videoBloc:_videoBloc),

                  ],
                ),
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
