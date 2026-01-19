import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/viewmodel/login/login_state.dart';

class LoginViewModel extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState.initial();
  }

  void changeSection({required Sections sectionNum}) {
    switch (sectionNum) {
      case Sections.first:
        state = state.copyWith(section: Sections.second);
      case Sections.second:
        state = state.copyWith(section: Sections.third);
      case Sections.third:
    }
  }

  void selectLoginType({required LoginType loginType}) {
    switch (loginType) {
      case LoginType.customer:
        state = state.copyWith(
          loginType: LoginType.customer,
          section: Sections.third,
        );
      case LoginType.roastery:
        state = state.copyWith(
          loginType: LoginType.roastery,
          section: Sections.third,
        );
    }
  }

  void thirdToSecond() {
    state = state.copyWith(section: Sections.second);
  }

  void changeEmail(String value) {
    state = state.copyWith(userEmail: value);
  }

  void changePassword(String value) {
    state = state.copyWith(userPassword: value);
  }
}
