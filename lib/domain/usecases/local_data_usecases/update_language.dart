import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/repositories/app_repository.dart';
import 'package:tmdb_movies_flutter/domain/usecases/usecase.dart';

class UpdateLanguage extends UseCase<void,String>{

  final AppRepository appRepository;


  UpdateLanguage(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String params) async {
    return await appRepository.updateLanguage(params);

  }

}