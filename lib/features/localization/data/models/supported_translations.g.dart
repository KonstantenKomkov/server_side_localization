// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_translations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportedTranslations _$SupportedTranslationsFromJson(
        Map<String, dynamic> json) =>
    SupportedTranslations(
      ru: json['ru'] == null
          ? null
          : Translations.fromJson(json['ru'] as Map<String, dynamic>),
      en: json['en'] == null
          ? null
          : Translations.fromJson(json['en'] as Map<String, dynamic>),
      ar: json['ar'] == null
          ? null
          : Translations.fromJson(json['ar'] as Map<String, dynamic>),
      fr: json['fr'] == null
          ? null
          : Translations.fromJson(json['fr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupportedTranslationsToJson(
        SupportedTranslations instance) =>
    <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'ar': instance.ar,
      'fr': instance.fr,
    };
