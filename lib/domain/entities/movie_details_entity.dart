import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable{

  int? id;
  String? backdropPath;
  String? posterPath;
  String? title;
  num? voteAverage;
  String? releaseDate;
  String? overview;

  MovieDetailEntity({
    this.backdropPath,
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify=>true;

}