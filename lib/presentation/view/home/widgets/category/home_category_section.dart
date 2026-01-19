import 'package:flutter/material.dart';
import 'package:thebeans/presentation/view/home/models/home_category_model.dart';
import 'package:thebeans/presentation/view/home/widgets/category/home_category_item.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key, required this.categoryList});

  final List<HomeCategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
