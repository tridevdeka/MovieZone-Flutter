import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/no_params.dart';
import 'package:tmdb_movies_flutter/domain/repositories/app_repository.dart';
import 'package:tmdb_movies_flutter/domain/usecases/usecase.dart';

class GetPreferredLanguage extends UseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}
