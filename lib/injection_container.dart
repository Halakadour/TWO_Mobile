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
import 'package:two_mobile/features/auth/role/data/datasource/role_local_datasource.dart';
import 'package:two_mobile/features/auth/role/data/datasource/role_remote_datasource.dart';
import 'package:two_mobile/features/auth/role/data/repos/role_repo_impl.dart';
import 'package:two_mobile/features/auth/role/domain/repos/role_repo.dart';
import 'package:two_mobile/features/auth/role/domain/usecases/get_client_role_usecase.dart';

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
        getClientRoleUsecase: sl()),
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

  /**----------------- ROLE FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(() => GetClientRoleUsecase(roleRepo: sl()));

  // Repos
  sl.registerLazySingleton<RoleRepo>(
    () => RoleRepoImpl(
        roleLocalDatasource: sl(),
        roleRemoteDatasource: sl(),
        networkInfo: sl()),
  );
  // DataSource
  sl.registerLazySingleton<RoleLocalDatasource>(
    () => RoleLocalDatasourceImpl(),
  );
  sl.registerLazySingleton<RoleRemoteDatasource>(
    () => RoleRemoteDatasourceImpl(),
  );

  ///////////////////////////////////////////////////////////////////////////////////////

  /* External */

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  final internetConnectionChecker = InternetConnectionChecker.createInstance();
  final networkInfo = NetworkInfoImpl(internetConnectionChecker);
  sl.registerLazySingleton(() => networkInfo);
}
