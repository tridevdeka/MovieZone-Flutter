
import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/screenutil/screenutil.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_text.dart';

import '../journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary:AppColor.royalBlue
        ),
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
