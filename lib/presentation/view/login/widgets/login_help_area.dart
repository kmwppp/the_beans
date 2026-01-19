import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class LoginHelpArea extends StatelessWidget {
  const LoginHelpArea({
    super.key,
    required this.content,
    required this.accentContent,
  });

  final String content;
  final String accentContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Row(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(content, style: context.caption),
            Text(accentContent, style: context.captionAccent),
          ],
        ),
      ],
    );
  }
}
