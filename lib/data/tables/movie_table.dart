import 'package:hive/hive.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_entity.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity{

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  MovieTable(this.id, this.title, this.posterPath);

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity){
    return MovieTable(movieEntity.id!, movieEntity.title!, movieEntity.posterPath!);
  }

}