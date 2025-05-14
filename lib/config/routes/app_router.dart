import 'package:go_router/go_router.dart';
import 'package:two_mobile/core/widgets/bottom_navigation_bar_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/client_fill_profile_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/forget_password_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/programmer_fill_profile_page.dart';
import 'package:two_mobile/features/intro/pages/on_board_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/intro/pages/splash_page.dart';
import 'app_route_config.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '', routes: [
    GoRoute(
      name: AppRouteConfig.splash,
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: AppRouteConfig.onboard,
      path: '/onboard',
      builder: (context, state) => const OnBoardPage(),
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
      name: AppRouteConfig.forget,
      path: '/forgotPassword',
      builder: (context, state) => const ForgetPasswordPage(),
    ),
    GoRoute(
      name: AppRouteConfig.programmerFillProfile,
      path: '/programmerFillProfile',
      builder: (context, state) => const ProgrammerFillProfilePage(),
    ),
    GoRoute(
      name: AppRouteConfig.clientFillProfile,
      path: '/clientFillProfile',
      builder: (context, state) => const ClientFillProfilePage(),
    ),
    GoRoute(
      name: AppRouteConfig.main,
      path: '/main',
      builder: (context, state) => const MainPage(),
    ),
  ]);
}
