import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:server_side_localization/features/localization/data/models/translations.dart';

part 'supported_translations.g.dart';

@JsonSerializable()
class SupportedTranslations {
  final Translations? ru;
  final Translations? en;
  final Translations? ar;
  final Translations? fr;

  SupportedTranslations({
    this.ru,
    this.en,
    this.ar,
    this.fr,
  });

  static const List<Locale> locales = [
    Locale('ru'),
    Locale('en'),
    Locale('ar'),
    Locale('fr'),
  ];

  factory SupportedTranslations.fromJson(Map<String, dynamic> json) =>
      _$SupportedTranslationsFromJson(json);
  Map<String, dynamic> toJson() => _$SupportedTranslationsToJson(this);

  List<Locale> get availableLocales =>
      toJson().keys.map((e) => Locale(e)).toList();
}
