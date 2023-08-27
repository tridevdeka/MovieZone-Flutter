import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_movies_flutter/common/constants/size_constants.dart';
import 'package:tmdb_movies_flutter/common/extensions/size_extensions.dart';
import 'package:tmdb_movies_flutter/presentation/themes/theme_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle? get _whiteHeadline6 => _poppinsTextTheme.titleLarge?.copyWith(
        fontSize: Sizes.dimen_20.sp.toDouble(),
        color: Colors.white,
      );

  static TextStyle? get _whiteHeadline5 => _poppinsTextTheme.headlineSmall?.copyWith(
        fontSize: Sizes.dimen_24.sp.toDouble(),
        color: Colors.white,
      );

  static TextStyle? get _whiteSubtitle1 => _poppinsTextTheme.titleMedium?.copyWith(
        fontSize: Sizes.dimen_16.sp.toDouble(),
        color: Colors.white,
      );

  static TextStyle? get _whiteButton => _poppinsTextTheme.labelLarge?.copyWith(
        fontSize: Sizes.dimen_14.sp.toDouble(),
        color: Colors.white,
      );

  static TextStyle? get _whiteBodyText2 => _poppinsTextTheme.bodyMedium?.copyWith(
        fontSize: Sizes.dimen_14.sp.toDouble(),
        color: Colors.white,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        headlineSmall: _whiteHeadline5,
        titleLarge: _whiteHeadline6,
        titleMedium: _whiteSubtitle1,
        bodyMedium: _whiteBodyText2,
        labelLarge: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle? get royalBlueSubtitle1 => titleLarge?.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get greySubtitle1 => titleMedium?.copyWith(
        color: Colors.grey,
      );

  TextStyle? get violetHeadline6 => titleLarge?.copyWith(
        color: AppColor.violet,
      );

  TextStyle? get vulcanBodyText2 => bodyMedium?.copyWith(
    color: AppColor.vulcan,
    fontWeight: FontWeight.w600,
  );
}
// Theme.of(context).textTheme.royalBlueSubtitle1
