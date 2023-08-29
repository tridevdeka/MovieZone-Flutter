import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateLanguage(String languageCode);

  Future<Either<AppError, String>> getPreferredLanguage();
}
