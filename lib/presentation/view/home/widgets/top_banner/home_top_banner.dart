import 'package:flutter/material.dart';
import 'package:thebeans/core/constants/app_colors.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_text_styles.dart';

class HomeTopBanner extends StatelessWidget {
  const HomeTopBanner({super.key});

  static const _bannerImage = "assets/images/main_top.png";
  static const _searchImage = "assets/images/search.png";

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        children: [
          Image.asset(_bannerImage, fit: BoxFit.cover),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87, Colors.black],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    color: AppColors.secondPrimary,
                    child: Text(AppStrings.topBannerTitle, style: context.body),
                  ),
                ),
                Text(AppStrings.roasteryTitle, style: context.bigTitle),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                _searchImage,
                width: 22,
                height: 22,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
