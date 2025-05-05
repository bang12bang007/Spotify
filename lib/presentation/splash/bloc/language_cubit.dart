import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  static Locale _getSystemLocale() {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    return Locale(systemLocale.languageCode);
  }

  LanguageCubit() : super(_getSystemLocale());
  void updateLanguage(Locale locale) => emit(locale);
  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json['languageCode']);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'languageCode': state.languageCode};
  }
}
