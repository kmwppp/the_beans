import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/provider/search/search_provider.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../home/models/home_category_model.dart';
import '../widgets/recent_keyword.dart';

class RecentSearchWordSection extends ConsumerWidget {
  const RecentSearchWordSection({
    super.key,
    required this.categoryList,
    required this.context,
  });

  final List<HomeCategoryModel> categoryList;
  final BuildContext context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchViewModelProvider);
    final notifier = ref.read(searchViewModelProvider.notifier);
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.recentSearchWordTitle,
                  style: context.titleMideum,
                ),
              ),
              GestureDetector(
                onTap: () {
                  notifier.clearRecentWords();
                },
                child: Text(
                  AppStrings.recentSearchWordsClear,
                  style: context.hint,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 26,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.recentWords.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RecentKeyword(keyword: state.recentWords[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
