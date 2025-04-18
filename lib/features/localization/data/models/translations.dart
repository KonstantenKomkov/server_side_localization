import 'package:json_annotation/json_annotation.dart';

part 'translations.g.dart';

@JsonSerializable()
class Translations {
  final String? materialAppTitle;
  final String? bookDetailPageTitle;
  final String? bookDetailPageText;
  final String? translationStatus;

  Translations({
    this.materialAppTitle,
    this.bookDetailPageTitle,
    this.bookDetailPageText,
    this.translationStatus,
  });

  factory Translations.fromJson(Map<String, dynamic> json) =>
      _$TranslationsFromJson(json);
  Map<String, dynamic> toJson() => _$TranslationsToJson(this);
}
