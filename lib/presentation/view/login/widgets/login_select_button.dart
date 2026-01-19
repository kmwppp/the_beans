import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class LoginSelectButton extends StatelessWidget {
  final String buttonText;
  const LoginSelectButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        alignment: Alignment.center,
        height: 40,
        child: Text(
          buttonText,
          style: context.body.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
