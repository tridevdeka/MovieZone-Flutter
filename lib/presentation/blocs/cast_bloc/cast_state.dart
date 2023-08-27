part of 'cast_bloc.dart';


abstract class CastState extends Equatable {

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoadingState extends CastState {}

class CastLoadedState extends CastState {
  final List<CastEntity> castList;

  CastLoadedState(this.castList);

  @override
  List<Object> get props => [castList];

}

class CastErrorState extends CastState {
  final AppErrorType errorType;

  CastErrorState(this.errorType);

  @override
  List<Object> get props => [errorType];
}
