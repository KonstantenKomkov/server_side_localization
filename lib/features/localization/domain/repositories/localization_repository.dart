import 'package:server_side_localization/features/localization/data/datasources/localization_remote_datasource.dart';
import 'package:server_side_localization/features/localization/data/models/language.dart';
import 'package:server_side_localization/features/localization/data/models/supported_translations.dart';
import 'package:server_side_localization/features/localization/domain/entities/language_entity.dart';

part 'package:server_side_localization/features/localization/data/repositories/localization_repository_impl.dart';

abstract class LocalizationRepository {
  Future<SupportedTranslations?> getSupportedLocales();

  Future<List<LanguageEntity>> languages();
}
