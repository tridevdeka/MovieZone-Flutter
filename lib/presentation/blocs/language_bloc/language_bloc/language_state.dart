part of 'language_bloc.dart';

abstract class LanguageState {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded({required this.locale});

  @override
  List<Object> get props => [locale.languageCode];
}
