import 'package:shared_preferences/shared_preferences.dart';
import 'package:thebeans/data/datasource/local/local_storage.dart';

/// Shared Preferences 구현체
class SharedPrefStorage implements LocalStorage {
  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  Future<void> setStringList(String key, List<String> value) async {
    final prefs = await _prefs;
    await prefs.setStringList(key, value);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    final prefs = await _prefs;
    return prefs.getStringList(key);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }
}
