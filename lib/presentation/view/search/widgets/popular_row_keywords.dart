import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/provider/search/search_provider.dart';
import 'package:thebeans/presentation/view/search/models/popular_word_model.dart';

import '../../../../core/theme/app_text_styles.dart';

class PopularRowKeywords extends ConsumerWidget {
  const PopularRowKeywords({
    super.key,
    required this.index,
    required this.popularWordList,
  });

  final int index;
  final List<PopularWordModel> popularWordList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchViewModelProvider);
    final notifier = ref.read(searchViewModelProvider.notifier);

    final firstNumber = index * 2 + 1;
    final secondNumber = index * 2 + 2;
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                notifier.onChangedSearchKeyword(
                  popularWordList[index].firstKeyword,
                );
                notifier.nextPage(state.searchPageIndex);
                notifier.saveRecentWord(
                  word: popularWordList[index].firstKeyword,
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text(
                      "$firstNumber",
                      style: context.hint,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(popularWordList[index].firstKeyword),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                notifier.onChangedSearchKeyword(
                  popularWordList[index].secondKeyword,
                );
                notifier.nextPage(state.searchPageIndex);
                notifier.saveRecentWord(
                  word: popularWordList[index].secondKeyword,
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text(
                      "$secondNumber",
                      style: context.hint,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(popularWordList[index].secondKeyword),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
