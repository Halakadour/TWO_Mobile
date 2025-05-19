import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_mobile/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:two_mobile/features/auth/data/repo/auth_repo_impl.dart';
import 'package:two_mobile/features/auth/domain/repo/auth_repo.dart';
import 'package:two_mobile/features/auth/domain/usecase/login_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:two_mobile/features/auth/domain/usecase/update_client_profile_usecase.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**----------------- AUTH FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUsecase: sl(),
      signUpUsecase: sl(),
      updateClientProfileUsecase: sl(),
    ),
  );
  // Usecases
  sl.registerLazySingleton(() => LoginUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => SignUpUsecase(authRepo: sl()));
  sl.registerLazySingleton(() => UpdateClientProfileUsecase(authRepo: sl()));

  // Repos
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDatasource: sl()),
  );
  // Datasources
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );

  ///////////////////////////////////////////////////////////////////////////////////////

  /* External */

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
