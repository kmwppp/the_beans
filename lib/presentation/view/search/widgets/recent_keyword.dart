import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/core/theme/app_text_styles.dart';
import 'package:thebeans/presentation/provider/search/search_provider.dart';

class RecentKeyword extends ConsumerWidget {
  const RecentKeyword({super.key, required this.keyword});

  final String keyword;

  final closeImageUrl = "assets/images/close.png";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchViewModelProvider);
    final notifier = ref.read(searchViewModelProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 6,
          children: [
            GestureDetector(
              onTap: () {
                notifier.onChangedSearchKeyword(keyword);
                notifier.nextPage(state.searchPageIndex);
              },
              child: Text(keyword, style: context.bodySmall),
            ),
            GestureDetector(
              onTap: () {
                notifier.removeRecentWord(word: keyword);
              },
              child: Image.asset(closeImageUrl, width: 10, height: 10),
            ),
          ],
        ),
      ),
    );
  }
}
