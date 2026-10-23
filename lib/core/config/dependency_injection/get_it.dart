import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:spotify/features/auth/data/repo_implementation/auth_repo_impl.dart';
import 'package:spotify/features/auth/domain/repo/auth_repo.dart';
import 'package:spotify/features/auth/domain/usecase/register_usecase.dart';
import 'package:spotify/features/auth/presentation/logic/auth_bloc.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  _setupAuth();
}

void _setupAuth() {
  // External
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<FirebaseAuth>()),
  );

  // Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepo>()),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(registerUseCase: getIt<RegisterUseCase>()),
  );
}