import 'package:dartz/dartz.dart';
import 'package:tmdb_movies_flutter/data/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';
import 'package:tmdb_movies_flutter/domain/usecases/usecase.dart';

import '../entities/no_params.dart';

class GetTrending extends UseCase<List<MovieEntity>?,NoParams> {
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  Future<Either<AppError, List<MovieEntity>?>> call(NoParams noParams) async {
    return await movieRepository.getTrending();
  }
}
