import 'package:flutter/material.dart';
import 'package:thebeans/core/theme/app_text_styles.dart';
import 'package:thebeans/data/dummy/dummy_data.dart';
import 'package:thebeans/data/model/product_item_model.dart';
import 'package:thebeans/presentation/view/home/widgets/product/home_product_item.dart';

class HomeProductSection extends StatelessWidget {
  HomeProductSection({super.key});

  final List<ProductItemModel> list = DummyData.productItemLists;

  @override
  Widget build(BuildContext context) {
    final screenWidth = ((MediaQuery.of(context).size.width - 40) / 3) + 8;
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("산미가 풍부한 원두", style: context.title),
          SizedBox(
            height: screenWidth * 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: HomeProductItem(model: list[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
