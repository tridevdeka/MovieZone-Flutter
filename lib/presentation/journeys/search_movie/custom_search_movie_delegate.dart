import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/search_movie_bloc/search_movie_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_text.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/app_error_widget.dart';

import 'search_movie_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty
            ? null
            : () {
                query = '';
              },
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchMovieLoadEvent(searchKeyWord: query),
    );

    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMovieLoadingState) {
          return Expanded(
            child: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SearchMovieLoadedState) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                child: Text(
                  TranslationConstant.noMoviesSearched.t(context)!,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => SearchMovieCard(
                movie: movies[index],
              ),
            );
          }
        } else if (state is SearchMovieErrorState) {
          return AppErrorWidget(
              errorType: state.errorType,
              onPressed: () {
                searchMovieBloc.add(SearchMovieLoadEvent(searchKeyWord: query));
              });
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
