import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:server_side_localization/features/localization/data/models/supported_translations.dart';
import 'package:server_side_localization/features/localization/data/models/translations.dart';
import 'package:server_side_localization/services/local_storage/local_storage_service.dart';

class LocalizationLocalDatasource {
  static final LocalizationLocalDatasource _singleton =
      LocalizationLocalDatasource._internal(LocalStorageService());
  factory LocalizationLocalDatasource() => _singleton;

  final LocalStorageService _localStorageService;
  LocalizationLocalDatasource._internal(this._localStorageService);

  static const String _localizationKey = 'localizationKey';
  static const String _languagePrefsKey = 'locale';

  Future<SupportedTranslations?> getTranslations() async {
    final response = await _localStorageService.getString(
      key: _localizationKey,
    );
    return response == null
        ? null
        : SupportedTranslations.fromJson(jsonDecode(response));
  }

  Future<void> saveTranslations(SupportedTranslations translations) async =>
      await _localStorageService.setValue(
        key: _localizationKey,
        value: jsonEncode(translations),
      );

  Future<Translations?> getTranslation(String locale) async {
    final response = await _localStorageService.getString(
      key: _localizationKey,
    );
    return response == null ? null : jsonDecode(response)[locale];
  }

  Future<void> cacheLocaleLanguage(Locale locales) async =>
      await _localStorageService.setValue(
        key: _languagePrefsKey,
        value: locales.languageCode,
      );
}
