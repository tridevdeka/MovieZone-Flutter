import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/common/constants/translation_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/common/extensions/string_extension.dart';

import '../../common/constants/size_constants.dart';
import '../themes/theme_color.dart';
import 'button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;

  final Widget? image;

  const AppDialog(this.image, {super.key, required this.title, required this.description, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w))),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
        ),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            blurRadius: Sizes.dimen_16,
            color: AppColor.vulcan,
          )
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context)!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
              child: Text(
                description.t(context)!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (image != null) image!,
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: TranslationConstant.okay,
            )
          ],
        ),
      ),
    );
  }
}
