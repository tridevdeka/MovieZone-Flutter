import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget({super.key, required this.title, required this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    width: Sizes.dimen_1.w,
                    color: isSelected ? AppColor.royalBlue : Colors.transparent
                )
            )
        ),
        child: Text(
          title,
          style: isSelected ? Theme
              .of(context)
              .textTheme
              .royalBlueSubtitle1 : Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
      ),
    );
  }
}
