// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "materialAppTitle": "Локализация приложения на сервере",
  "bookDetailPageTitle": "Алиса в стране чудес",
  "bookDetailPageText": "Вниз по кроличьей норе",
  "translationStatus": "Текст из приложения"
};
static const Map<String,dynamic> en = {
  "materialAppTitle": "Server side localization",
  "bookDetailPageTitle": "Alice's Adventures in Wonderland",
  "bookDetailPageText": "Down the Rabbit-Hole",
  "translationStatus": "Text from app"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
