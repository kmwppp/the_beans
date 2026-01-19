import 'package:flutter/material.dart';
import 'package:thebeans/core/theme/app_text_styles.dart';

class LoginStartDivider extends StatelessWidget {
  const LoginStartDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Container(color: Colors.white, height: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(text, style: context.body),
        ),
        Expanded(child: Container(color: Colors.white, height: 1)),
      ],
    );
  }
}
