import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/provider/login/login_provider.dart';
import 'package:thebeans/presentation/view/login/widgets/login_help_area.dart';
import 'package:thebeans/presentation/view/login/widgets/login_select_button.dart';
import 'package:thebeans/presentation/view/login/widgets/login_start_divider.dart';
import 'package:thebeans/presentation/viewmodel/login/login_state.dart';

import '../../../../core/constants/app_strings.dart';

class LoginSecondSection extends ConsumerWidget {
  const LoginSecondSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        LoginStartDivider(text: AppStrings.starting),
        GestureDetector(
          onTap: () {
            notifier.selectLoginType(loginType: LoginType.customer);
          },
          child: LoginSelectButton(buttonText: AppStrings.customer),
        ),
        GestureDetector(
          onTap: () {
            notifier.selectLoginType(loginType: LoginType.roastery);
          },
          child: LoginSelectButton(buttonText: AppStrings.roastery),
        ),
        _bottomSection(),
      ],
    );
  }

  Column _bottomSection() {
    return Column(
      spacing: 6,
      children: [
        Container(color: Colors.white, width: double.infinity, height: 1),
        LoginHelpArea(
          content: AppStrings.notYetUser,
          accentContent: AppStrings.register,
        ),
      ],
    );
  }
}
