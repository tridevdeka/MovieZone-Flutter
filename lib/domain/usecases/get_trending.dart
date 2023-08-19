import 'package:tmdb_movies_flutter/data/repositories/movie_repository.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';

class GetTrending {
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  Future<List<MovieEntity>?> call() async {
    return await movieRepository.getTrending();
  }
}
