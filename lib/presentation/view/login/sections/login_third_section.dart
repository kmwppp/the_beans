import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thebeans/core/theme/app_text_styles.dart';
import 'package:thebeans/presentation/provider/login/login_provider.dart';
import 'package:thebeans/presentation/view/login/widgets/login_confirm_button.dart';
import 'package:thebeans/presentation/view/login/widgets/login_help_area.dart';
import 'package:thebeans/presentation/view/login/widgets/login_start_divider.dart';
import 'package:thebeans/presentation/viewmodel/login/login_viewmodel.dart';

import '../../../../core/constants/app_strings.dart';
import 'widgets/login_third_input.dart';

class LoginThirdSection extends ConsumerWidget {
  const LoginThirdSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        LoginStartDivider(text: AppStrings.login),
        LoginThirdInput(
          inputTitle: AppStrings.email,
          inputHint: AppStrings.insertEmail,
          onChanged: notifier.changeEmail,
        ),
        LoginThirdInput(
          inputTitle: AppStrings.password,
          inputHint: AppStrings.insertPassword,
          onChanged: notifier.changePassword,
        ),
        LoginHelpArea(
          content: AppStrings.forgetPassword,
          accentContent: AppStrings.findPassword,
        ),
        GestureDetector(
          onTap: () {
            print("${state.userEmail} / ${state.userPassword}");
            // 원래는 Navigator로 push를 했으나 라우터 설정으로 인해 아래로 변경
            context.go('/main');
          },
          child: LoginConfirmButton(buttonTitle: AppStrings.login),
        ),

        _bottomSection(notifier, context),
      ],
    );
  }

  Column _bottomSection(LoginViewModel notifier, BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Container(color: Colors.white, width: double.infinity, height: 1),
        LoginHelpArea(
          content: AppStrings.notYetUser,
          accentContent: AppStrings.register,
        ),
        GestureDetector(
          onTap: () {
            notifier.thirdToSecond();
          },
          child: Text(AppStrings.goBack, style: context.captionAccent),
        ),
      ],
    );
  }
}
