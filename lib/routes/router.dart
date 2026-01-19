import 'package:go_router/go_router.dart';
import 'package:thebeans/presentation/view/login/login_page_main.dart';
import 'package:thebeans/presentation/view/main/main_page.dart';

final goRouter = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginPageMain()),
    GoRoute(path: '/main', builder: (context, state) => MainPage()),
  ],
);
