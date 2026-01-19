import 'package:thebeans/data/datasource/local/local_storage.dart';

/// 비즈니스 규칙 담당
class SearchRepository {
  static const _recentKey = "recent_search_keywords";

  final LocalStorage localStorage;

  SearchRepository(this.localStorage);

  /// 최근 검색어 전체 조회
  Future<List<String>> loadRecentKeywords() async {
    return await localStorage.getStringList(_recentKey) ?? [];
  }

  /// 최근 검색어 추가
  Future<void> addKeyword(String keyword) async {
    final list = await loadRecentKeywords();

    // 중복 제거
    list.remove(keyword);

    // 최신 검색어 앞으로
    list.insert(0, keyword);

    // 최대 10개 제한
    if (list.length > 10) {
      list.removeLast();
    }

    await localStorage.setStringList(_recentKey, list);
  }

  /// 최근 검색어 삭제
  Future<void> removeKeyword(String keyword) async {
    final list = await loadRecentKeywords();

    list.remove(keyword);
    await localStorage.setStringList(_recentKey, list);
  }

  /// 최근 검색어 전체 삭제
  Future<void> clear() {
    return localStorage.remove(_recentKey);
  }
}
