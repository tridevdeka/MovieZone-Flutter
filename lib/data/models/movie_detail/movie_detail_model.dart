import 'dart:developer';

import 'package:tmdb_movies_flutter/data/models/movie_detail/production_companies.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_details_entity.dart';

import 'belongs_to_collection.dart';
import 'genres.dart';
import 'production_countries.dart';
import 'spoken_languages.dart';

class MovieDetailModel extends MovieDetailEntity {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;

  MovieDetailModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  }): super(
    id: id,
    title: title,
    backdropPath: backdropPath,
    posterPath: posterPath,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    overview: overview,
  );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection:
          json['belongs_to_collection'] != null ? BelongsToCollection.fromJson(json['belongs_to_collection']) : null,
      budget: json['budget'],
      genres: _genres(json),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: _productionCompanies(json),
      productionCountries: _productionCountries(json),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: _spokenLanguages(json),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      map['belongs_to_collection'] = belongsToCollection!.toJson();
    }
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries!.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages!.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

_spokenLanguages(Map<String, dynamic> json) {
  if (json['spoken_languages'] != null) {
    final spokenLanguages = List<SpokenLanguages>.empty(growable: true);
    json['spoken_languages'].forEach((v) {
      spokenLanguages.add(SpokenLanguages.fromJson(v));
    });
  }
}

_productionCountries(Map<String, dynamic> json) {
  if (json['production_countries'] != null) {
    final productionCountries = List<ProductionCountries>.empty(growable: true);
    json['production_countries'].forEach((v) {
      productionCountries.add(ProductionCountries.fromJson(v));
    });
  }
}

_productionCompanies(Map<String, dynamic> json) {
  if (json['production_companies'] != null) {
    final productionCompanies = List<ProductionCompanies>.empty(growable: true);
    json['production_companies'].forEach((v) {
      productionCompanies.add(ProductionCompanies.fromJson(v));
    });
  }
}

_genres(Map<String, dynamic> json) {
  if (json['genres'] != null) {
    final genres = List<Genres>.empty(growable: true);
    json['genres'].forEach((v) {
      genres.add(Genres.fromJson(v));
    });
  }
}
