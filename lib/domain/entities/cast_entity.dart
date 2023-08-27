import 'package:equatable/equatable.dart';

class CastEntity extends Equatable{

  String? creditId;
  String? name;
  String? profilePath;
  String? character;


  CastEntity(this.creditId, this.name, this.profilePath, this.character);

  @override
  List<Object?> get props => [creditId];
}