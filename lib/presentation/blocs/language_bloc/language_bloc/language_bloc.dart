import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/language_entity.dart';

import '../../../../common/constants/languages.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(locale: Locale(Languages.languages[0].code))) {
    on<ToggleLanguageEvent>(_toggleLanguageEvent);
  }

  FutureOr<void> _toggleLanguageEvent(ToggleLanguageEvent event, Emitter<LanguageState> emit) {
    emit(LanguageLoaded(locale: Locale(event.languageEntity.code)));
  }
}
