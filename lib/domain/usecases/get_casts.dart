import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/data/models/credits/cast.dart';
import 'package:tmdb_movies_flutter/domain/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/cast_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';
import 'package:tmdb_movies_flutter/domain/usecases/usecase.dart';

import '../entities/movie_details_entity.dart';

class GetCasts extends UseCase<List<CastEntity>?, MovieParams> {
  final MovieRepository movieRepository;

  GetCasts(this.movieRepository);

  @override
  Future<Either<AppError, List<CastEntity>?>> call(MovieParams params) async {
    return await movieRepository.getCasts(params.id);
  }
}
