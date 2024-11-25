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
import 'package:admin/features/dashboard/data/datasources/orders_remote_datasource.dart';
import 'package:admin/features/dashboard/data/repositories/orders_repo.dart';
import 'package:admin/features/dashboard/presentation/cubit/orders_cubit.dart';
import 'package:admin/features/products/data/datasources/products_remote_datasource.dart';
import 'package:admin/features/products/data/repositories/products_repo.dart';
import 'package:admin/features/template/cubit/header/header_cubit.dart';
import 'package:admin/features/products/presentation/cubit/products_cubit.dart';
import 'package:admin/features/template/cubit/sidebar/sidebar_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Firebase
  getIt.registerSingleton<FirebaseStorageManagerImp>(
      FirebaseStorageManagerImp());
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

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

  // Cubits are singleton to preserve state
  getIt.registerSingleton<HeaderCubit>(HeaderCubit());
  getIt.registerSingleton<SidebarCubit>(SidebarCubit());

  // Dashboard
  // Orders
  getIt.registerSingleton<OrdersRemoteDatasourceImp>(
      OrdersRemoteDatasourceImp(firestore: getIt<FirebaseFirestore>()));
  getIt.registerSingleton<OrdersRepoImp>(
      OrdersRepoImp(remoteDatasource: getIt<OrdersRemoteDatasourceImp>()));
  getIt.registerSingleton<OrdersCubit>(OrdersCubit());

  // Products
  getIt.registerSingleton<ProductsCubit>(ProductsCubit());
}
