/// Local Storage 인터페이스
abstract class LocalStorage {
  Future<void> setStringList(String key, List<String> value);
  Future<List<String>?> getStringList(String key);
  Future<void> remove(String key);
}
