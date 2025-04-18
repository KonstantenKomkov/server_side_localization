import 'package:flutter/material.dart';
import 'package:server_side_localization/features/localization/data/models/supported_translations.dart';
import 'package:server_side_localization/features/localization/domain/entities/language_entity.dart';

class LocalizationService {
  static final LocalizationService _localizationService =
      LocalizationService._internal();
  factory LocalizationService() => _localizationService;

  LocalizationService._internal();

  final ValueNotifier<List<Locale>> supportedLocalesNotifier =
      ValueNotifier(SupportedTranslations.locales);

  List<LanguageEntity> _languages = [];
  Locale? locale;

  void setLanguages(List<LanguageEntity> languages) {
    _languages = languages;
    supportedLocalesNotifier.value = supportedLocales;
  }

  List<Locale> get supportedLocales {
    final localesFromLanguages = _languages
        .map((language) => language.toLocale())
        .whereType<Locale>()
        .toList();
    if (localesFromLanguages.isEmpty) {
      return SupportedTranslations.locales;
    }
    return localesFromLanguages;
  }
}
