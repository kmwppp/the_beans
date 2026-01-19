import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/provider/search/search_provider.dart';
import 'package:thebeans/presentation/view/search/search_page_main.dart';
import 'package:thebeans/presentation/view/search/search_result_page.dart';
import 'package:thebeans/presentation/view/search/widgets/search_appbar.dart';

class SearchMain extends ConsumerWidget {
  SearchMain({super.key});

  final List<Widget> _pages = [SearchPageMain(), SearchResultPage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchViewModelProvider);
    final notifier = ref.read(searchViewModelProvider.notifier);
    return Scaffold(
      appBar: SearchAppBar(
        isResultPage: false,
        searchKeyword: state.searchWord,
        onChanged: notifier.onChangedSearchKeyword,
        onSubmitted: (value) {
          notifier.saveRecentWord(word: value);
          notifier.nextPage(state.searchPageIndex);
        },
        clickedCancel: () {
          notifier.clearKeyword();
          if (state.searchPageIndex != 0) {
            notifier.prePage(state.searchPageIndex);
          }
        },
      ),
      body: IndexedStack(index: state.searchPageIndex, children: _pages),
    );
  }
}
