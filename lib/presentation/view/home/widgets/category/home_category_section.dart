import 'package:flutter/material.dart';
import 'package:thebeans/presentation/view/home/models/home_category_model.dart';
import 'package:thebeans/presentation/view/home/widgets/category/home_category_item.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
    required this.categoryList,
    required this.verticalPadding,
    required this.axis,
  });

  final List<HomeCategoryModel> categoryList;
  final double verticalPadding;
  final MainAxisAlignment axis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
          mainAxisAlignment: axis,
          spacing: 30,
          children: List.generate(
            categoryList.length,
            (index) => HomeCategoryItem(categoryItem: categoryList[index]),
          ),
        ),
      ),
    );
  }
}
