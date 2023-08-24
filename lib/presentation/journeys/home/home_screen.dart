import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/di/get_it.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/movie_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(CarouselInitialEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCarouselBloc, MovieCarouselState>(
      bloc: movieCarouselBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case MovieCarouselLoadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case MovieCarouselLoaded:
            final loadedState = state as MovieCarouselLoaded;
            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: loadedState.movies!,
                      defaultIndex: loadedState.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: Placeholder(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );

          default:
            return SizedBox();
        }
      },
      listener: (previous, current) {},
    );
  }
}
