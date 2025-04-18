import 'package:server_side_localization/features/localization/data/datasources/localization_local_datasource.dart';
import 'package:server_side_localization/features/localization/data/models/supported_translations.dart';
import 'package:server_side_localization/features/localization/data/models/translations.dart';
part 'package:server_side_localization/features/localization/data/repositories/localization_cache_repository_impl.dart';

abstract class LocalizationCacheRepository {
  Future<SupportedTranslations?> getSupportedLocales();

  Future<Translations?> getSupportedLocale(String locale);
}
