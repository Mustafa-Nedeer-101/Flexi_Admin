import 'package:admin/core/utils/managers/firebase_storage.dart';
import 'package:admin/core/utils/managers/local_storage.dart';
import 'package:admin/core/utils/managers/network_manager.dart';
import 'package:admin/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:admin/features/authentication/data/datasources/user_local_datasource.dart';
import 'package:admin/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:admin/features/authentication/data/repositories/auth_repo.dart';
import 'package:admin/features/authentication/data/repositories/user_repo.dart';
import 'package:admin/features/authentication/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:admin/features/authentication/presentation/bloc/redirect_cubit/redirct_cubit.dart';
import 'package:admin/features/template/data/datasources/products_remote_datasource.dart';
import 'package:admin/features/template/data/repositories/products_repo.dart';
import 'package:admin/features/template/presentation/cubit/header/header_cubit.dart';
import 'package:admin/features/template/presentation/cubit/home/home_cubit.dart';
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

  // Firebase Storage Manager
  getIt.registerSingleton<FirebaseStorageManagerImp>(
      FirebaseStorageManagerImp());

  // Authentication
  getIt.registerSingleton<AuthRemoteDatasourceImp>(AuthRemoteDatasourceImp());
  getIt.registerSingleton(
      UserLocalDatasourceImp(storage: getIt<FlutterSecureStorageImp>()));
  getIt.registerSingleton<UserRemoteDatasourceImp>(UserRemoteDatasourceImp());
  getIt.registerSingleton<UserRepoImp>(UserRepoImp(
      localDatasource: getIt<UserLocalDatasourceImp>(),
      remoteDatasource: getIt<UserRemoteDatasourceImp>()));
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp(
      remoteDatasource: getIt<AuthRemoteDatasourceImp>(),
      networkManager: getIt<ConnectivityPlusImpl>()));

  getIt.registerFactory<RedirectCubit>(() => RedirectCubit());
  getIt.registerFactory<LoginCubit>(() => LoginCubit());

  // Template
  getIt.registerSingleton<ProductsRemoteDatasourceImp>(
      ProductsRemoteDatasourceImp(storage: getIt<FirebaseStorageManagerImp>()));
  getIt.registerSingleton<ProductsRepoImp>(
      ProductsRepoImp(datasource: getIt<ProductsRemoteDatasourceImp>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit());

  getIt.registerFactory<HeaderCubit>(() => HeaderCubit());
}
