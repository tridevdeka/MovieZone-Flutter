import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [AppColor.royalBlue,AppColor.violet]
        ),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_20.w))
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
      height: Sizes.dimen_16.h,
      child: TextButton(
        onPressed: () {
          onPressed.call();
        },
        child: Text(
          text.t(context)!,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
