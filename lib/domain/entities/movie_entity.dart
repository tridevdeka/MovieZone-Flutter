import 'package:equatable/equatable.dart';

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

}