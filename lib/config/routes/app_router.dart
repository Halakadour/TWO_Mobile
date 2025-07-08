import 'package:go_router/go_router.dart';
import 'package:two_mobile/core/widgets/bottom_navigation_bar_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/client_fill_profile_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/forget_password_page.dart';
import 'package:two_mobile/features/auth/presentation/pages/programmer_fill_profile_page.dart';
import 'package:two_mobile/features/task/presentation/pages/add_new_task_page.dart';
import 'package:two_mobile/features/team/presentation/pages/add_project_manager_page.dart';
import 'package:two_mobile/features/team/presentation/pages/add_team_page.dart';
import 'package:two_mobile/features/task/presentation/pages/all_comments_page.dart';
import 'package:two_mobile/features/home/presentation/pages/calender_page.dart';
import 'package:two_mobile/features/home/presentation/pages/home_page.dart';
import 'package:two_mobile/features/team/presentation/pages/make_team_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/recent_project_page.dart';
import 'package:two_mobile/features/task/presentation/pages/task_details_page.dart';
import 'package:two_mobile/features/task/presentation/pages/today_task_page.dart';
import 'package:two_mobile/features/inbox/presentation/pages/inbox_page.dart';
import 'package:two_mobile/features/intro/pages/on_board_page.dart';
import 'package:two_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:two_mobile/features/projects/data/model/project_model.dart';
import 'package:two_mobile/features/projects/presentation/pages/add_meeting_page.dart';
import 'package:two_mobile/features/sprint/presentation/pages/add_sprint_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/meeting_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/payment_history_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/project_detailes_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/projects_page.dart';
import 'package:two_mobile/features/sprint/presentation/pages/sprint_detailes_page.dart';
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
      name: AppRouteConfig.projectDetailes,
      path: '/projectDetailes',
      builder: (context, state) =>
          ProjectDetailesPage(projectModel: state.extra as ProjectModel),
    ),
    GoRoute(
      name: AppRouteConfig.recentproject,
      path: '/recentProject',
      builder: (context, state) => const RecentprojectPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addTeam,
      path: '/addTeamPage',
      builder: (context, state) => const AddTeamPage(),
    ),
    GoRoute(
      name: AppRouteConfig.makeTeam,
      path: '/makeTeam',
      builder: (context, state) => const MakeTeamPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addProjectManagerPage,
      path: '/addProjectManagerPage',
      builder: (context, state) => const AddProjectManagerPage(),
    ),
    GoRoute(
      name: AppRouteConfig.toDayTask,
      path: '/toDayTask',
      builder: (context, state) => const TodayTaskPage(),
    ),
    GoRoute(
      name: AppRouteConfig.taskDetatialsPage,
      path: '/taskDetailsPage',
      builder: (context, state) => const TaskDetailsPage(),
    ),
    GoRoute(
      name: AppRouteConfig.allCommentsPage,
      path: '/allCommentsPage',
      builder: (context, state) => const AllCommentsPage(),
    ),
    GoRoute(
      name: AppRouteConfig.calendar,
      path: '/calendar',
      builder: (context, state) => const CalenderPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addSprint,
      path: '/addSprint',
      builder: (context, state) => const AddSprintPage(),
    ),
    GoRoute(
      name: AppRouteConfig.sprintDetailes,
      path: '/sprintDetailes',
      builder: (context, state) => const SprintDetailesPage(),
    ),
    GoRoute(
      name: AppRouteConfig.payementHistory,
      path: '/payementHistory',
      builder: (context, state) => PaymentHistoryPage(),
    ),
    GoRoute(
      name: AppRouteConfig.meeting,
      path: '/meeting',
      builder: (context, state) => const MeetingPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addMeeting,
      path: '/addMeeting',
      builder: (context, state) => const AddMeetingPage(),
    ),
    GoRoute(
      name: AppRouteConfig.addNewTask,
      path: '/addNewTask',
      builder: (context, state) => const AddNewTaskPage(),
    ),
  ]);
}
