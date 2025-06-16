import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_mobile/core/network/network_connection_checker.dart';
import 'package:two_mobile/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:two_mobile/features/auth/data/repo/auth_repo_impl.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';
import 'package:two_mobile/features/auth/domain/usecase/login_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/update_client_profile_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/update_programmer_profile_usecase.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/role/data/datasources/role_local_datasource.dart';
import 'package:two_mobile/features/role/data/datasources/role_remote_datasource.dart';
import 'package:two_mobile/features/role/data/repos/role_repo_impl.dart';
import 'package:two_mobile/features/role/domain/repos/role_repo.dart';
import 'package:two_mobile/features/role/domain/usecases/show_role_client_usecase.dart';
import 'package:two_mobile/features/role/domain/usecases/show_roles_without_client_usecase.dart';
import 'package:two_mobile/features/team/data/datasource/team_datasource.dart';
import 'package:two_mobile/features/team/data/repo/team_impl.dart';
import 'package:two_mobile/features/team/domain/repo/team_repo.dart';
import 'package:two_mobile/features/team/domain/usecase/add_members_usecase.dart';
import 'package:two_mobile/features/team/domain/usecase/create_team_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**----------------- AUTH FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
        loginUsecase: sl(),
        signUpUsecase: sl(),
        updateClientProfileUsecase: sl(),
        updateProgrammerProfileUsecase: sl(),
        showClientRoleUsecase: sl(),
        showProgrammerRoleUsecase: sl()),
  );
  // Usecases
  sl.registerLazySingleton(() => LoginUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => SignUpUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => UpdateClientProfileUsecase(authRepo: sl()));
  sl.registerLazySingleton(
      () => UpdateProgrammerProfileUsecase(authRepo: sl()));

  // Repos
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDatasource: sl()),
  );
  // Datasources
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );

  /**----------------- HONE FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
      () => HomeBloc(createTeamUsecase: sl(), addMembersUsecase: sl()));

  /**----------------- ROLE FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(() => ShowClientRoleUsecase(sl()));
  sl.registerLazySingleton(() => ShowProgrammerRoleUsecase(sl()));

  // Repos
  sl.registerLazySingleton<RoleRepo>(
    () => RoleRepoImpl(sl(), sl(), sl()),
  );
  // DataSource
  sl.registerLazySingleton<RoleLocalDatasource>(
    () => RoleLocalDatasourceImpl(),
  );
  sl.registerLazySingleton<RoleRemoteDatasource>(
    () => RoleRemoteDatasourceImpl(),
  );

  /**----------------- TEAM FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(() => CreateTeamUsecase(teamRepo: sl()));
  sl.registerLazySingleton(() => AddMembersUsecase(teamRepo: sl()));

  // Repos
  sl.registerLazySingleton<TeamRepo>(() => TeamRepoImpl(teamDatasource: sl()));
  // DataSource
  sl.registerLazySingleton<TeamDatasource>(
    () => TeamDatasourceImpl(),
  );

  ///////////////////////////////////////////////////////////////////////////////////////

  /* CORE */
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /* External */

  final sharedPreferences = await SharedPreferences.getInstance();
  final internetConnectionChecker = InternetConnectionChecker.createInstance();
  final networkInfo = NetworkInfoImpl(internetConnectionChecker);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => internetConnectionChecker);
  sl.registerLazySingleton(() => networkInfo);
}
