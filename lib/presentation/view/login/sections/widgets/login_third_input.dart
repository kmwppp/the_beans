import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/core/theme/app_text_styles.dart';

class LoginThirdInput extends ConsumerWidget {
  const LoginThirdInput({
    super.key,
    required this.inputTitle,
    required this.inputHint,
    required this.onChanged,
  });
  final String inputTitle;
  final String inputHint;

  //실무기준으로 onChange를 받는다
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(inputTitle, style: context.body),
        _inputUserInfo(context),
      ],
    );
  }

  ClipRRect _inputUserInfo(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: double.infinity,
        height: 40,
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          onChanged: (value) {
            onChanged(value);
          },
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            hintText: inputHint,
          ),
          style: context.body,
        ),
      ),
    );
  }
}
