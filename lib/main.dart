import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:server_side_localization/core/assets_cache_remote_loader.dart';
import 'package:server_side_localization/core/assets_catalog.dart';
import 'package:server_side_localization/features/book/presentation/pages/book_detail.page.dart';
import 'package:server_side_localization/features/localization/data/models/supported_translations.dart';
import 'package:server_side_localization/features/localization/domain/entities/language_entity.dart';
import 'package:server_side_localization/features/localization/domain/repositories/localization_cache_repository.dart';
import 'package:server_side_localization/features/localization/domain/repositories/localization_repository.dart';
import 'package:server_side_localization/generated/locale_keys.g.dart';
import 'package:server_side_localization/services/localization/fallback_localization_delegate.dart';
import 'package:server_side_localization/services/localization/localization_service.dart';
import 'package:server_side_localization/services/package_info/package_info_service.dart';

part 'package:server_side_localization/app_mixin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final (packageInfo, _) = await (
    PackageInfo.fromPlatform(),
    EasyLocalization.ensureInitialized()
  ).wait;
  final packageInfoService = PackageInfoService();
  packageInfoService.packageInfo = packageInfo;
  runApp(const LocalizedApp());
}

class LocalizedApp extends StatelessWidget {
  const LocalizedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalizationService().supportedLocalesNotifier,
      builder: (BuildContext context, List<Locale> value, Widget? child) {
        return EasyLocalization(
          supportedLocales: value,
          path: AssetsCatalog.localization,
          assetLoader: AssetCacheRemoteLoader(),
          child: App(),
        );
      },
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with AppMixin {
  @override
  Widget build(BuildContext context) {
    LocalizationService().locale = EasyLocalization.of(context)?.locale;
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        EasyLocalization.of(context)!.delegate,
        FallbackLocalizationDelegate(),
      ],
      title: LocaleKeys.materialAppTitle.tr(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      locale: EasyLocalization.of(context)?.locale,
      supportedLocales: EasyLocalization.of(context)?.supportedLocales ?? [],
      home: BookDetailPage(),
    );
  }
}
