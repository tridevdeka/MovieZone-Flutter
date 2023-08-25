import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/app_error_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({super.key});

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc => BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
    movieTabbedBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
        bloc: movieTabbedBloc,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_1.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                      TabTitleWidget(
                        title: MovieTabbedConstants.movieTabs[i].title,
                        onTap: () {
                          _onTabTapped(i);
                        },
                        isSelected: MovieTabbedConstants.movieTabs[i].index == state.currentTabbedIndex,
                      )
                  ],
                ),
                if (state is MovieTabbedLoadingState)
                  Expanded(child: Center(child: CircularProgressIndicator()))
                else if (state is MovieTabbedChangedState)
                  state.movies?.isEmpty ?? true
                      ? Expanded(
                          child: Center(
                              child: Text(
                          TranslationConstant.noMovies.t(context)!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        )))
                      : Expanded(
                          child: MovieListViewBuilder(
                          movies: state.movies!,
                        ))
                else if (state is MovieTabbedLoadErrorState)
                  Expanded(
                    child: AppErrorWidget(
                      errorType: state.errorType,
                      onPressed: () {
                        movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
                      },
                    ),
                  )
              ],
            ),
          );
        });
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
