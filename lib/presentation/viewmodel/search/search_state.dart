class SearchState {
  final int searchPageIndex;
  final String searchWord;
  final List<String> recentWords;

  const SearchState({
    required this.searchPageIndex,
    required this.searchWord,
    required this.recentWords,
  });

  SearchState copyWith({
    int? searchPageIndex,
    String? searchWord,
    List<String>? recentWords,
  }) {
    return SearchState(
      searchPageIndex: searchPageIndex ?? this.searchPageIndex,
      searchWord: searchWord ?? this.searchWord,
      recentWords: recentWords ?? this.recentWords,
    );
  }

  factory SearchState.initial() {
    return SearchState(searchPageIndex: 0, searchWord: "", recentWords: []);
  }
}
