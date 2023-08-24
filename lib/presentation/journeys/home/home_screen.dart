import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/di/get_it.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(CarouselInitialEvent());

    //registerLazySingleton also can provide same instance
    // movieBackdropBloc = getItInstance<MovieBackdropBloc>();
    //Same instance is initialized which added on MovieCarouselBloc
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarouselBloc>(
          create: (BuildContext context) => movieCarouselBloc,
        ),
        BlocProvider<MovieBackdropBloc>(
          create: (context) => movieBackdropBloc,
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
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
                return Stack(
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
                );

              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
