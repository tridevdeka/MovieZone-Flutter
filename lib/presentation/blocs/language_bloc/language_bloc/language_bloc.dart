import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_flutter/domain/entities/app_error.dart';
import 'package:tmdb_movies_flutter/domain/entities/language_entity.dart';
import 'package:tmdb_movies_flutter/domain/entities/no_params.dart';

import '../../../../common/constants/languages.dart';
import '../../../../domain/usecases/local_data_usecases/get_preferred_language.dart';
import '../../../../domain/usecases/local_data_usecases/update_language.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageBloc({required this.getPreferredLanguage, required this.updateLanguage})
      : super(LanguageLoaded(locale: Locale(Languages.languages[0].code))) {
    on<ToggleLanguageEvent>(_toggleLanguageEvent);
    on<LoadPreferredLanguageEvent>(_loadPreferredLanguageEvent);
  }

  FutureOr<void> _toggleLanguageEvent(ToggleLanguageEvent event, Emitter<LanguageState> emit) async {
    await updateLanguage(event.languageEntity.code);
    add(LoadPreferredLanguageEvent());
  }

  FutureOr<void> _loadPreferredLanguageEvent(LoadPreferredLanguageEvent event, Emitter<LanguageState> emit) async {
    final response = await getPreferredLanguage(NoParams());
    emit(response.fold((l) => LanguageLoadedError(l.appErrorType), (r) => LanguageLoaded(locale: Locale(r))));
  }
}
