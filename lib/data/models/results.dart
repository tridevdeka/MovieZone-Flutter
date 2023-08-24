import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  @override
  final String? backdropPath;
  @override
  final int? id;
  @override
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  @override
  final String? overview;
  @override
  final String? posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final num? popularity;
  @override
  final String? releaseDate;
  final bool? video;
  @override
  final num? voteAverage;
  final int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(dynamic json) {
    return MovieModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        mediaType: json['media_type'],
        genreIds:
            json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [],
        popularity: json['popularity']?? 0.0,
        releaseDate: json['release_date'],
        video: json['video'],
        voteAverage: json['vote_average']?? 0.0,
        voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['title'] = title;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}
