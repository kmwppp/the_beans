import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/provider/search/search_provider.dart';
import 'package:thebeans/presentation/viewmodel/search/search_state.dart';

class SearchViewModel extends Notifier<SearchState> {
  bool _initialized = false;
  @override
  SearchState build() {
    // UI 재렌더링 방지
    if (!_initialized) {
      _initialized = true;
      _loadRecentKeywords();
      return SearchState.initial();
    }
    // 역시 UI 재렌더링 방지
    return state;
  }

  void onChangedSearchKeyword(String keyword) {
    state = state.copyWith(searchWord: keyword);
  }

  void clearKeyword() {
    state = state.copyWith(searchWord: "");
  }

  void nextPage(int pageNum) {
    state = state.copyWith(searchPageIndex: pageNum + 1);
  }

  void prePage(int pageNum) {
    state = state.copyWith(searchPageIndex: pageNum - 1);
  }

  Future<void> _loadRecentKeywords() async {
    final repository = ref.read(searchRepositoryProvider);
    final keywords = await repository.loadRecentKeywords();
    state = state.copyWith(recentWords: keywords);
  }

  Future<void> saveRecentWord({required String word}) async {
    final repository = ref.read(searchRepositoryProvider);
    await repository.addKeyword(word);
    final keywords = await repository.loadRecentKeywords();
    state = state.copyWith(recentWords: keywords);
  }

  Future<void> removeRecentWord({required String word}) async {
    final repository = ref.read(searchRepositoryProvider);
    await repository.removeKeyword(word);
    final keywords = await repository.loadRecentKeywords();
    state = state.copyWith(recentWords: keywords);
  }

  Future<void> clearRecentWords() async {
    final repository = ref.read(searchRepositoryProvider);
    await repository.clear();
    final keywords = await repository.loadRecentKeywords();
    state = state.copyWith(recentWords: keywords);
  }
}
