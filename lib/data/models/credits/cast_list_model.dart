import 'cast.dart';
import 'crew.dart';

class CastListModel {
  int? id;
  List<CastModel>? cast;
  List<Crew>? crew;

  CastListModel({
    this.id,
    this.cast,
    this.crew,
  });

  CastListModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast!.add(CastModel.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew!.add(Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (cast != null) {
      map['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      map['crew'] = crew!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
