part of 'package:server_side_localization/main.dart';

mixin AppMixin on State<App> {
  @override
  void initState() {
    _initApp();
    super.initState();
  }

  void _initApp() async {
    await _yourBusinessLogic();
    await _localize();
  }

  /// For example: we should made any queries before make localization queries
  /// or any business logic with async methods
  Future<void> _yourBusinessLogic() async =>
      await Future.delayed(Duration(seconds: 1));

  Future<void> _localize() async {
    final (
      List<LanguageEntity> languages,
      SupportedTranslations? translations,
    ) = await (
      LocalizationRepositoryImpl().languages(),
      LocalizationRepositoryImpl().getSupportedLocales(),
    ).wait;

    if (translations != null) {
      unawaited(
          LocalizationCacheRepositoryImpl().saveTranslations(translations));
      _resetTranslations(
        translations: translations,
        languages: languages,
      );
    }
  }

  Future<void> _resetTranslations({
    required SupportedTranslations translations,
    required List<LanguageEntity> languages,
  }) async {
    final provider = EasyLocalization.of(context);
    AssetCacheRemoteLoader().translations = translations;
    if (LocalizationService().locale != null && provider != null) {
      await provider.delegate.localizationController?.loadTranslations();
      await provider.delegate.load(LocalizationService().locale!);
      LocalizationService().setLanguages(languages);
    }
  }
}
