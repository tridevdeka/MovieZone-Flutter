import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/data/data_sources/language_local_data_source.dart';

import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';

import '../../domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDatSource languageLocalDatSource;

  AppRepositoryImpl(this.languageLocalDatSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDatSource.getLanguage();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String languageCode) async {
    try {
      final response = await languageLocalDatSource.updateLanguage(languageCode);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
}
