import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/provider/login/login_provider.dart';
import 'package:thebeans/presentation/view/login/widgets/login_confirm_button.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../viewmodel/login/login_state.dart';

class LoginFirstSection extends ConsumerWidget {
  const LoginFirstSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);
    return Column(
      spacing: 14,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.firstTitle, style: context.bigTitle),
        Text(AppStrings.firstTitleCaption, style: context.body),
        GestureDetector(
          onTap: () {
            notifier.changeSection(sectionNum: Sections.first);
          },
          child: LoginConfirmButton(buttonTitle: AppStrings.starting),
        ),
      ],
    );
  }
}
