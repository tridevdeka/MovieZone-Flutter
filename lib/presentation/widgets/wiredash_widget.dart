import 'package:flutter/material.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashWidget extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashWidget({super.key, this.navigatorKey, required this.child, required this.languageCode});

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: navigatorKey,
      secret: 'dnti7bsiGLvQBZhHBooNpbm6pRikRA6V',
      projectId: 'movies-app-flutter-kpdwu2r',
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
      ),
      child: child,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(languageCode: languageCode)
      ),
    );
  }
}
