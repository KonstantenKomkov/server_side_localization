import 'package:flutter/material.dart';

/// [FallbackLocalizationDelegate] is class to prevent app crash on unsupported local
/// for example xog
class FallbackLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const DefaultMaterialLocalizations();

  @override
  bool shouldReload(old) => false;
}
