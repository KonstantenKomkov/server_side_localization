import 'package:package_info_plus/package_info_plus.dart';
import 'package:server_side_localization/services/package_info/package_info_local_datasource.dart';

class PackageInfoService {
  static final PackageInfoService _packageInfoService =
      PackageInfoService._internal(PackageInfoLocalDatasource());
  factory PackageInfoService() {
    return _packageInfoService;
  }
  PackageInfoService._internal(this._packageInfoLocalDatasource);

  final PackageInfoLocalDatasource _packageInfoLocalDatasource;

  PackageInfo? packageInfo;

  bool? _isAnotherVersion;

  bool isAndroidWithGoogleServices = false;

  Future<bool> isAnotherVersion() async {
    if (_isAnotherVersion != null) return _isAnotherVersion!;
    if (packageInfo?.buildNumber == null) {
      _isAnotherVersion = false;
      return _isAnotherVersion!;
    }
    final oldBuildNumber = await _packageInfoLocalDatasource.getBuildNumber();
    if (oldBuildNumber != packageInfo?.buildNumber) {
      _isAnotherVersion = true;
      _packageInfoLocalDatasource.saveBuildNumber(
        buildNumber: packageInfo!.buildNumber,
      );
      return _isAnotherVersion!;
    }
    _isAnotherVersion = false;
    return _isAnotherVersion!;
  }
}
