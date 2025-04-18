import 'package:server_side_localization/services/local_storage/local_storage_service.dart';

class PackageInfoLocalDatasource {
  final LocalStorageService _localStorageService;

  static final PackageInfoLocalDatasource _singleton =
      PackageInfoLocalDatasource._internal(LocalStorageService());

  factory PackageInfoLocalDatasource() => _singleton;

  PackageInfoLocalDatasource._internal(this._localStorageService);

  static const String buildNumberKey = "buildNumber";

  Future<String?> getBuildNumber() async {
    try {
      return await _localStorageService.getString(key: buildNumberKey);
    } catch (e) {
      return null;
    }
  }

  Future<void> saveBuildNumber({
    required String buildNumber,
  }) async =>
      await _localStorageService.setValue(
        key: buildNumberKey,
        value: buildNumber,
      );
}
