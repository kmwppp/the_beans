import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thebeans/presentation/viewmodel/login/login_state.dart';
import 'package:thebeans/presentation/viewmodel/login/login_viewmodel.dart';

final loginViewModelProvider = NotifierProvider<LoginViewModel, LoginState>(
  LoginViewModel.new,
);
