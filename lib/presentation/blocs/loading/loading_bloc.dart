import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loading_event.dart';

part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<StartLoadingEvent>(_startLoadingEvent);
    on<FinishLoadingEvent>(_finishLoadingEvent);
  }

  FutureOr<void> _startLoadingEvent(StartLoadingEvent event, Emitter<LoadingState> emit) {
    emit(LoadingStarted());
  }

  FutureOr<void> _finishLoadingEvent(FinishLoadingEvent event, Emitter<LoadingState> emit) {
    emit(LoadingFinished());
  }
}
