import 'results.dart';

class MoviesResultModel {
  int? page;
  List<MovieModel>? results = [];
  int? totalPages;
  int? totalResults;

  MoviesResultModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MoviesResultModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
