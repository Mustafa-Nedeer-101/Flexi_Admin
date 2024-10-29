import 'package:admin/core/utils/managers/local_storage.dart';
import 'package:admin/core/utils/managers/network_manager.dart';
import 'package:admin/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:admin/features/authentication/data/datasources/user_local_datasource.dart';
import 'package:admin/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:admin/features/authentication/data/repositories/auth_repo.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:admin/features/authentication/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:admin/features/authentication/presentation/bloc/redirect_cubit/redirct_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjecion() async {
  // Network
  getIt.registerSingleton<ConnectivityPlusImpl>(ConnectivityPlusImpl());

  // Storage
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton(
      FlutterSecureStorageImp(storage: getIt<FlutterSecureStorage>()));

  // Authentication
  getIt.registerSingleton<AuthRemoteDatasourceImp>(AuthRemoteDatasourceImp());
  getIt.registerSingleton(
      UserLocalDatasourceImp(storage: getIt<FlutterSecureStorageImp>()));
  getIt.registerSingleton<UserRemoteDatasourceImp>(UserRemoteDatasourceImp());
  getIt.registerSingleton<UserRepoImp>(
      UserRepoImp(localDatasource: getIt<UserLocalDatasourceImp>()));
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp(
      remoteDatasource: getIt<AuthRemoteDatasourceImp>(),
      networkManager: getIt<ConnectivityPlusImpl>()));

  getIt.registerFactory<RedirectCubit>(() => RedirectCubit());
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
}
