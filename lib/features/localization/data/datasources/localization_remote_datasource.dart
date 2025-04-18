import 'package:server_side_localization/features/localization/data/models/language.dart';
import 'package:server_side_localization/features/localization/data/models/supported_translations.dart';
import 'package:server_side_localization/features/localization/data/models/translations.dart';

class LocalizationRemoteDatasource {
  static final LocalizationRemoteDatasource _singleton =
      LocalizationRemoteDatasource._internal();
  factory LocalizationRemoteDatasource() => _singleton;
  LocalizationRemoteDatasource._internal();

  /// Make your query, I'll use mock data with delay
  Future<SupportedTranslations?> getSupportedLocales() async =>
      await Future.delayed(
        Duration(seconds: 1),
        () => SupportedTranslations(
          ru: Translations(
            materialAppTitle: "Локализация приложения на сервере*",
            bookDetailPageTitle: "Алиса в стране чудес*",
            bookDetailPageText: "Вниз по кроличьей норе*",
            translationStatus: "Текст с сервера",
          ),
          en: Translations(
            materialAppTitle: "Server side localization*",
            bookDetailPageTitle: "Alice's Adventures in Wonderland*",
            bookDetailPageText: "Down the Rabbit-Hole*",
            translationStatus: "Text from server",
          ),
          ar: Translations(
            materialAppTitle: "توطين التطبيق على الخادم*",
            bookDetailPageTitle: "أليس في بلاد العجائب*",
            bookDetailPageText: "أسفل حفرة الأرنب*",
            translationStatus: "نص من الخادم",
          ),
          fr: Translations(
            materialAppTitle: "Localisation de l'application sur le serveur*",
            bookDetailPageTitle: "Alice au pays des merveilles*",
            bookDetailPageText: "Dans le Terrier du lapin*",
            translationStatus: "Texte du serveur",
          ),
        ),
      );

  /// Make your query, I'll use mock data with delay
  Future<List<Language>> getSupportedLanguages() async => await Future.delayed(
        Duration(seconds: 1),
        () => [
          Language(
            id: 1,
            culture: 'ru',
            name: 'Русский',
          ),
          Language(
            id: 2,
            culture: 'en',
            name: 'English',
          ),
          Language(
            id: 3,
            culture: 'ar',
            name: 'العربية',
          ),
          Language(
            id: 4,
            culture: 'fr',
            name: 'Français',
          ),
        ],
      );
}
