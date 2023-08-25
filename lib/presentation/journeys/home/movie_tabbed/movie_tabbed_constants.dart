import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';

import 'tab.dart';

class MovieTabbedConstants {
  static List<Tab> movieTabs = [
    Tab(index: 0, title: TranslationConstant.popular),
    Tab(index: 1, title: TranslationConstant.now),
    Tab(index: 2, title: TranslationConstant.soon),
  ];
}
