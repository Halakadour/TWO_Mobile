import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/intro/presentation/pages/splash_page.dart';
import '../../main_page.dart';
import 'app_route_config.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: AppRouteConfig.splash,
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: AppRouteConfig.login,
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: AppRouteConfig.signup,
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      name: AppRouteConfig.main,
      path: '/main',
      builder: (context, state) => const MainPage(),
    ),
  ]);
}
