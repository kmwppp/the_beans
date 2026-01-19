import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    required this.isResultPage,
    required this.searchKeyword,
    required this.onChanged,
    required this.onSubmitted,
    required this.clickedCancel,
  });

  final bool isResultPage;
  final String searchKeyword;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback clickedCancel;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _SearchAppBarState extends State<SearchAppBar> {
  final searchImageUrl = "assets/images/search.png";

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchKeyword);
  }

  @override
  void didUpdateWidget(covariant SearchAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // state.searchWord가 변경되면 TextField 반영
    if (oldWidget.searchKeyword != widget.searchKeyword) {
      _controller.text = widget.searchKeyword;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Container(
                  color: AppColors.productBackColor,
                  height: 30,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          searchImageUrl,
                          color: AppColors.hintTextColor,
                          width: 20,
                          height: 20,
                          fit: BoxFit.fitHeight,
                        ),
                      ),

                      Expanded(
                        child: TextField(
                          controller: _controller,
                          onChanged: (value) {
                            widget.onChanged(value);
                          },
                          onSubmitted: (value) {
                            widget.onSubmitted(value);
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: AppStrings.searchBarHint,
                            hintStyle: AppTextStyles.hintText,
                          ),
                          style: context.body,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.searchKeyword.isNotEmpty)
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 12),
                  minimumSize: Size.zero,
                ),
                onPressed: widget.clickedCancel,
                child: Text("취소", style: AppTextStyles.bodyMedium),
              ),
          ],
        ),
      ),
    );
  }
}
