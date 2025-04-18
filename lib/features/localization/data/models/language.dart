import 'package:json_annotation/json_annotation.dart';
import 'package:server_side_localization/features/localization/domain/entities/language_entity.dart';

part 'language.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Language {
  final int? id;
  final String? name;
  final String? culture;

  Language({
    this.id,
    this.name,
    this.culture,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

extension LanguageX on Language {
  LanguageEntity toEntity() {
    return LanguageEntity(
      id: id,
      name: name,
      culture: culture,
    );
  }
}
