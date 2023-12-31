import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/common/constants/languages.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/presentation/blocs/language_bloc/language_bloc/language_bloc.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

import '../../../common/constants/route_constants.dart';
import '../../widgets/app_dialog.dart';
import '../favorite_screen/favorite_screen.dart';
import 'navigation_expanded_list_tile.dart';

class HomeNavigationDrawer extends StatelessWidget {
  const HomeNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          blurRadius: 4,
        ),
      ]),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
              ),
              child: Logo(
                height: Sizes.dimen_6.h,
              ),
            ),
            NavigationListItem(
              title: TranslationConstant.favoriteMovies.t(context)!,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.favoriteScreen);
                /*Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FavoriteMovieScreen(),
                  ),
                );*/
              },
            ),
            NavigationExpandListItem(
              title: TranslationConstant.language.t(context)!,
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context).add(
                  ToggleLanguageEvent(
                    languageEntity: Languages.languages[index],
                  ),
                );
              },
            ),
            NavigationListItem(
                title: TranslationConstant.feedback.t(context)!,
                onPressed: () {
                  Navigator.of(context).pop();
                  Wiredash.of(context).show();
                }),
            NavigationListItem(
                title: TranslationConstant.about.t(context)!,
                onPressed: () {
                  Navigator.of(context).pop();
                  _showDialog(context);
                }),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AppDialog(
            Image.asset(
              'assets/pngs/tmdb_logo.png',
              height: Sizes.dimen_32.h,
            ),
            title: TranslationConstant.about,
            description: TranslationConstant.aboutDescription,
            buttonText: TranslationConstant.okay,
          );
        });
  }
}
