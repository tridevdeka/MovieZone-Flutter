import 'results.dart';

class VideoResult {
  int? id;
  List<VideoModel>? results;

  VideoResult({
    this.id,
    this.results,
  });

  VideoResult.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (results != null) {
      map['results'] = results!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
