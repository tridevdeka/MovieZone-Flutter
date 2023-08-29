import 'package:equatable/equatable.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_details_entity.dart';

class MovieEntity extends Equatable{

  int? id;
  String? backdropPath;
  String? posterPath;
  String? title;
  num? voteAverage;
  String? releaseDate;
  String? overview;

  MovieEntity({
    this.backdropPath,
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  @override
  List<Object?> get props => [id,title];

  @override
  bool get stringify=>true;

  factory MovieEntity.fromMovieDetailEntity(MovieDetailEntity movieDetailEntity){
    return MovieEntity(
      backdropPath: movieDetailEntity.backdropPath,
      overview: movieDetailEntity.overview ,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
      posterPath: movieDetailEntity.posterPath,
      title: movieDetailEntity.title,
      id:movieDetailEntity.id
    );
  }

}