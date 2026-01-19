import 'package:flutter/material.dart';
import 'package:thebeans/core/constants/app_colors.dart';
import 'package:thebeans/core/theme/app_text_styles.dart';
import 'package:thebeans/data/model/product_item_model.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({super.key, required this.model});

  final ProductItemModel model;

  final cupNoteImageUrl = "assets/images/cupnote.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      color: AppColors.productBackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageSection(),
          const Divider(color: Colors.white, height: 1),
          _contentSection(context),
        ],
      ),
    );
  }

  Widget _contentSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            style: context.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(cupNoteImageUrl, width: 10),
              Text(model.cupnote, style: context.caption),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.white,
                  width: 16,
                  child: Image.asset(model.brandImageUrl, width: 10),
                ),
              ),
              Spacer(),
              Text(
                model.price,
                style: context.body.copyWith(
                  color: AppColors.productPriceColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(width: 130, model.imageUrl, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
