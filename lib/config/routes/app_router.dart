import 'package:go_router/go_router.dart';
import 'package:two_mobile/core/widgets/bottom_navigation_bar_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/client_fill_profile_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/forget_password_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/programmer_fill_profile_page.dart';
import 'package:two_mobile/features/home/presentation/pages/add_new_task_page.dart';
import 'package:two_mobile/features/home/presentation/pages/add_team_member_page.dart';
import 'package:two_mobile/features/home/presentation/pages/calender_page.dart';
import 'package:two_mobile/features/home/presentation/pages/home_page.dart';
import 'package:two_mobile/features/home/presentation/pages/make_team_page.dart';
import 'package:two_mobile/features/home/presentation/pages/recentproject_page.dart';
import 'package:two_mobile/features/home/presentation/pages/todattask_page.dart';
import 'package:two_mobile/features/inbox/presentation/pages/inbox_page.dart';
import 'package:two_mobile/features/intro/pages/on_board_page.dart';
import 'package:two_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/add_sprint_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/project_detailes_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/projects_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/sprint_detailes_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/intro/pages/splash_page.dart';
import 'app_route_config.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/', routes: [
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
      name: AppRouteConfig.home,
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: AppRouteConfig.project,
      path: '/project',
      builder: (context, state) => const ProjectsPage(),
    ),
    GoRoute(
      name: AppRouteConfig.inbox,
      path: '/inbox',
      builder: (context, state) => const InBoxPage(),
    ),
    GoRoute(
      name: AppRouteConfig.profile,
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      name: AppRouteConfig.main,
      path: '/main',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      name: AppRouteConfig.projectdetailes,
      path: '/projectdetailes',
      builder: (context, state) => const ProjectDetailesPage(),
    ),
    GoRoute(
      name: AppRouteConfig.recentproject,
      path: '/recentproject',
      builder: (context, state) => const RecentprojectPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addteammember,
      path: '/addteammember',
      builder: (context, state) => const AddTeamMemberPage(),
    ),
    GoRoute(
      name: AppRouteConfig.maketeam,
      path: '/maketeam',
      builder: (context, state) => const MakeTeamPage(),
    ),
    GoRoute(
      name: AppRouteConfig.todaytask,
      path: '/todaytask',
      builder: (context, state) => const TodayTaskPage(),
    ),
    GoRoute(
      name: AppRouteConfig.calendar,
      path: '/calendar',
      builder: (context, state) => const CalenderPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addsprint,
      path: '/addsprint',
      builder: (context, state) => const AddSprintPage(),
    ),
    GoRoute(
      name: AppRouteConfig.sprintdetailes,
      path: '/sprintdetailes',
      builder: (context, state) => SprintDetailesPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addnewtask,
      path: '/addnewtask',
      builder: (context, state) => const AddNewTaskPage(),
    ),
  ]);
}
