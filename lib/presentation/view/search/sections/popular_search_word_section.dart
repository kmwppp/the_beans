import 'package:flutter/material.dart';
import 'package:thebeans/presentation/view/search/widgets/popular_row_keywords.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../models/popular_word_model.dart';

class PopularSearchWordSection extends StatelessWidget {
  const PopularSearchWordSection({super.key, required this.popularWordList});

  final List<PopularWordModel> popularWordList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        spacing: 18,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.popularSearchWordTitle, style: context.titleMideum),
          SizedBox(
            height: 300,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
              itemBuilder: (context, index) {
                return PopularRowKeywords(
                  index: index,
                  popularWordList: popularWordList,
                );
              },
              separatorBuilder: (_, _) => Divider(height: 1),
              itemCount: popularWordList.length,
            ),
          ),
        ],
      ),
    );
  }
}
