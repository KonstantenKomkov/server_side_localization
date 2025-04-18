import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _singleton =
      LocalStorageService._internal(SharedPreferencesAsync());

  factory LocalStorageService() => _singleton;

  LocalStorageService._internal(this._prefs);

  final SharedPreferencesAsync _prefs;

  Future<String?> getString({
    required String key,
  }) async =>
      await _prefs.getString(key);

  Future<void> setValue({
    required String key,
    required Object value,
  }) async {
    if (value is String) {
      await _prefs.setString(key, value);
      return;
    }
    if (value is int) {
      await _prefs.setInt(key, value);
      return;
    }
    if (value is bool) {
      await _prefs.setBool(key, value);
      return;
    }
    if (value is double) {
      await _prefs.setDouble(key, value);
      return;
    }
    if (value is List<String>) {
      await _prefs.setStringList(key, value);
      return;
    }
  }

  Future<void> removeValue({
    required String key,
  }) async =>
      await _prefs.remove(key);

  Future<void> clear() async => await _prefs.clear();
}
