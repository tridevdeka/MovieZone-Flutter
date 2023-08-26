import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({super.key});

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
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
      ],
    );
  }
}
