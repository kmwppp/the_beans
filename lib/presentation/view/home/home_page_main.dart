import 'package:flutter/material.dart';
import 'package:thebeans/presentation/view/home/models/home_category_model.dart';
import 'package:thebeans/presentation/view/home/widgets/category/home_category_section.dart';
import 'package:thebeans/presentation/view/home/widgets/product/home_product_section.dart';
import 'package:thebeans/presentation/view/home/widgets/top_banner/home_top_banner.dart';

class HomePageMain extends StatelessWidget {
  HomePageMain({super.key});

  final List<HomeCategoryModel> categoryList = [
    HomeCategoryModel(iconUrl: "assets/images/blendingIcon.png", title: "블렌드"),
    HomeCategoryModel(iconUrl: "assets/images/singleOIcon.png", title: "싱글오리진"),
    HomeCategoryModel(iconUrl: "assets/images/decaffIcon.png", title: "디카페인"),
    HomeCategoryModel(iconUrl: "assets/images/specialIcon.png", title: "스페셜티"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HomeTopBanner()),
          SliverToBoxAdapter(
            child: HomeCategorySection(
              categoryList: categoryList,
              verticalPadding: 30,
              axis: MainAxisAlignment.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              spacing: 20,
              children: [
                HomeProductSection(),
                HomeProductSection(),
                HomeProductSection(),
                HomeProductSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
