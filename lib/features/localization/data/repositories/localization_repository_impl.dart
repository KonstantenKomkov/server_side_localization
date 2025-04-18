part of 'package:server_side_localization/features/localization/domain/repositories/localization_repository.dart';

class LocalizationRepositoryImpl implements LocalizationRepository {
  static final LocalizationRepositoryImpl _singleton =
      LocalizationRepositoryImpl._internal(LocalizationRemoteDatasource());

  factory LocalizationRepositoryImpl() => _singleton;
  final LocalizationRemoteDatasource _remoteDataSource;
  LocalizationRepositoryImpl._internal(this._remoteDataSource);

  @override
  Future<SupportedTranslations?> getSupportedLocales() async =>
      await _remoteDataSource.getSupportedLocales();

  @override
  Future<List<LanguageEntity>> languages() async =>
      (await _remoteDataSource.getSupportedLanguages())
          .map((Language language) => language.toEntity())
          .toList();
}
