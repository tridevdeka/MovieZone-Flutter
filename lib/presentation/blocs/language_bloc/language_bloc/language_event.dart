part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class LoadPreferredLanguageEvent extends LanguageEvent{

}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEntity languageEntity;

  const ToggleLanguageEvent({required this.languageEntity});

  @override
  List<Object?> get props => [languageEntity.code];
}
