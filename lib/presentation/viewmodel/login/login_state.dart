enum Sections { first, second, third }

enum LoginType { customer, roastery }

class LoginState {
  final Sections section;
  final LoginType loginType;
  final String userEmail;
  final String userPassword;

  const LoginState({
    required this.section,
    required this.loginType,
    required this.userEmail,
    required this.userPassword,
  });

  LoginState copyWith({
    Sections? section,
    LoginType? loginType,
    String? userEmail,
    String? userPassword,
  }) {
    return LoginState(
      section: section ?? this.section,
      loginType: loginType ?? this.loginType,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  factory LoginState.initial() {
    return LoginState(
      section: Sections.first,
      loginType: LoginType.customer,
      userEmail: "",
      userPassword: "",
    );
  }
}
