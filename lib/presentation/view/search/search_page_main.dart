import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/provider/search/search_provider.dart';
import 'package:thebeans/presentation/view/search/sections/popular_search_word_section.dart';
import 'package:thebeans/presentation/view/search/sections/recent_search_word_section.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';
import '../home/models/home_category_model.dart';
import '../home/widgets/category/home_category_section.dart';
import 'models/popular_word_model.dart';

class SearchPageMain extends ConsumerWidget {
  SearchPageMain({super.key});

  final List<HomeCategoryModel> categoryList = [
    HomeCategoryModel(iconUrl: "assets/images/blendingIcon.png", title: "블렌드"),
    HomeCategoryModel(iconUrl: "assets/images/singleOIcon.png", title: "싱글오리진"),
    HomeCategoryModel(iconUrl: "assets/images/decaffIcon.png", title: "디카페인"),
    HomeCategoryModel(iconUrl: "assets/images/specialIcon.png", title: "스페셜티"),
  ];

  final List<PopularWordModel> popularWordList = [
    PopularWordModel(firstKeyword: "헤헤", secondKeyword: "호호"),
    PopularWordModel(firstKeyword: "헤헤", secondKeyword: "호호"),
    PopularWordModel(firstKeyword: "헤헤", secondKeyword: "호호"),
    PopularWordModel(firstKeyword: "헤헤", secondKeyword: "호호"),
    PopularWordModel(firstKeyword: "헤헤", secondKeyword: "호호"),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchViewModelProvider);

    return SafeArea(
      minimum: EdgeInsets.only(left: 20),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          if (state.recentWords.isNotEmpty)
            RecentSearchWordSection(
              categoryList: categoryList,
              context: context,
            ),

          _categorySection(context),

          PopularSearchWordSection(popularWordList: popularWordList),
        ],
      ),
    );
  }

  Column _categorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.searchCategoryTitle, style: context.titleMideum),
        HomeCategorySection(
          categoryList: categoryList,
          verticalPadding: 10,
          axis: MainAxisAlignment.start,
        ),
      ],
    );
  }
}
