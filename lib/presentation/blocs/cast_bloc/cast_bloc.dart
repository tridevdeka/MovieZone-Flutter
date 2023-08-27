import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/cast_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/movie_params.dart';

import '../../../domain/usecases/get_casts.dart';

part 'cast_event.dart';

part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCasts getCasts;

  CastBloc(this.getCasts) : super(CastInitial()) {
    on<CastLoadEvent>(_castLoadEvent);
  }

  FutureOr<void> _castLoadEvent(CastLoadEvent event, Emitter<CastState> emit) async {
    emit(CastLoadingState());
    final castEither = await getCasts(MovieParams(id: event.movieId));
    emit(castEither.fold((l) => CastErrorState(l.appErrorType), (r) => CastLoadedState(r!)));
  }
}
