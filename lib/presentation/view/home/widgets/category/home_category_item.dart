import 'package:flutter/material.dart';
import 'package:thebeans/core/theme/app_text_styles.dart';

import '../../models/home_category_model.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({super.key, required this.categoryItem});

  final HomeCategoryModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(categoryItem.iconUrl, width: 50),
        Text(categoryItem.title, style: context.caption),
      ],
    );
  }
}
