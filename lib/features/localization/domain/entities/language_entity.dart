import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:server_side_localization/features/localization/data/models/language.dart';

class LanguageEntity extends Equatable {
  final int? id;
  final String? name;
  final String? culture;

  const LanguageEntity({
    this.id,
    this.name,
    this.culture,
  });

  @override
  List<Object?> get props => [
        if (id != null) id!,
        if (name != null) name!,
        if (culture != null) culture!,
      ];

  Locale? toLocale() {
    if (!kMaterialSupportedLanguages.contains(culture)) return null;
    return Locale(culture!);
  }

  Language toModel() {
    return Language(
      id: id,
      name: name,
      culture: culture,
    );
  }
}
