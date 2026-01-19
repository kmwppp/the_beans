import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/data/repository/search_repository.dart';
import 'package:thebeans/presentation/viewmodel/search/search_state.dart';

import '../../../data/datasource/local/local_storage.dart';
import '../../../data/datasource/local/shared_pref_storage.dart';
import '../../viewmodel/search/search_viewmodel.dart';

/// SearchViewModel Provider
final searchViewModelProvider = NotifierProvider<SearchViewModel, SearchState>(
  SearchViewModel.new,
);

/// LocalStorage Provider
final localStorageProvider = Provider<LocalStorage>((ref) {
  return SharedPrefStorage();
});

/// Repository Provider
final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(ref.read(localStorageProvider));
});
