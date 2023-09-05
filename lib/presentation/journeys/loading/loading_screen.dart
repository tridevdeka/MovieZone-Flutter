import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/loading/loading_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/loading/loading_circle.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
       return Stack(fit: StackFit.expand, children: [
          screen,
          if (state is LoadingStarted)
            Container(
              decoration: BoxDecoration(color: AppColor.vulcan.withOpacity(0.8)),
              child: Center(
                child: LoadingCircle(
                  size: Sizes.dimen_200.w,
                ),
              ),
            ),
        ]);
      },
    );
  }
}
