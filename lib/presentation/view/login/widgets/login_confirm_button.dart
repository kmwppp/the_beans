import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class LoginConfirmButton extends StatelessWidget {
  const LoginConfirmButton({super.key, required this.buttonTitle});

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(100),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        color: AppColors.secondPrimary,
        child: Text(
          buttonTitle,
          style: context.body,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
