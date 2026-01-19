import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/view/login/sections/login_first_section.dart';
import 'package:thebeans/presentation/view/login/sections/login_second_section.dart';
import 'package:thebeans/presentation/view/login/sections/login_third_section.dart';
import 'package:thebeans/presentation/viewmodel/login/login_state.dart';

import '../../provider/login/login_provider.dart';

class LoginPageMain extends ConsumerWidget {
  const LoginPageMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            child: _getSection(state.section),
          ),
        ),
      ),
    );
  }

  Widget _getSection(Sections section) {
    switch (section) {
      case Sections.first:
        return LoginFirstSection();
      case Sections.second:
        return LoginSecondSection();
      case Sections.third:
        return LoginThirdSection();
    }
  }
}
