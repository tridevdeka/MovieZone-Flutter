import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:tmdb_movies_flutter/presentation/widgets/logo.dart';

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
            NavigationListItem(title: 'Favorite Movies', onPressed: (){}),
            NavigationExpandListItem(title: 'Language',onPressed: (){},
            children: const [
              'English',
              'Spanish'
            ],),
            NavigationListItem(title: 'Feedback', onPressed: (){}),
            NavigationListItem(title: 'About', onPressed: (){}),
          ],
        ),
      ),
    );
  }
}