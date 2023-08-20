import 'package:dartz/dartz.dart';
import '../../data/repositories/movie_repository.dart';
import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import 'usecase.dart';

import '../entities/no_params.dart';

class GetTrending extends UseCase<List<MovieEntity>?,NoParams> {
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  Future<Either<AppError, List<MovieEntity>?>> call(NoParams noParams) async {
    return await movieRepository.getTrending();
  }
}
