part of 'package:server_side_localization/features/localization/domain/repositories/localization_cache_repository.dart';

class LocalizationCacheRepositoryImpl extends LocalizationCacheRepository {
  static final LocalizationCacheRepositoryImpl _singleton =
      LocalizationCacheRepositoryImpl._internal(LocalizationLocalDatasource());

  factory LocalizationCacheRepositoryImpl() => _singleton;
  LocalizationCacheRepositoryImpl._internal(this._localDatasource);

  final LocalizationLocalDatasource _localDatasource;

  @override
  Future<SupportedTranslations?> getSupportedLocales() async =>
      await _localDatasource.getTranslations();

  @override
  Future<Translations?> getSupportedLocale(
    String locale,
  ) async {
    final response = await _localDatasource.getTranslations();
    if (response != null) {
      return response.toJson()[locale] ?? response.en;
    }
    return null;
  }

  Future<void> saveTranslations(
    SupportedTranslations translations,
  ) async =>
      await _localDatasource.saveTranslations(translations);
}
