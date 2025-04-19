import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:server_side_localization/features/localization/data/models/supported_translations.dart';
import 'package:server_side_localization/features/localization/data/models/translations.dart';
import 'package:server_side_localization/features/localization/domain/repositories/localization_cache_repository.dart';
import 'package:server_side_localization/generated/codegen_loader.g.dart';
import 'package:server_side_localization/services/package_info/package_info_service.dart';

class AssetCacheRemoteLoader extends RootBundleAssetLoader {
  static final AssetCacheRemoteLoader _singleton =
      AssetCacheRemoteLoader._internal();
  factory AssetCacheRemoteLoader() => _singleton;

  AssetCacheRemoteLoader._internal();

  bool isFirstLoading = true;
  SupportedTranslations? translations;

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    if (translations != null) {
      final value = translations!.toJson()[locale.languageCode];
      if (value is Translations) {
        return value.toJson();
      }
      return CodegenLoader.mapLocales.containsKey(locale.languageCode)
          ? CodegenLoader.mapLocales[locale.languageCode]
          : CodegenLoader.mapLocales['en'];
    }

    final (
      localData,
      assetData,
      isAnotherVersion,
    ) = await (
      LocalizationCacheRepositoryImpl().getSupportedLocale(locale.languageCode),
      Future.value(CodegenLoader.mapLocales[locale.languageCode]),
      PackageInfoService().isAnotherVersion(),
    ).wait;

    if (isAnotherVersion && isFirstLoading) {
      isFirstLoading = false;
      final currentLocale =
          CodegenLoader.mapLocales.containsKey(locale.languageCode)
              ? locale
              : Locale('en');
      return CodegenLoader.mapLocales[currentLocale.languageCode];
    }
    return localData == null
        ? CodegenLoader.mapLocales[locale.languageCode]
        : localData.toJson();
  }
}
