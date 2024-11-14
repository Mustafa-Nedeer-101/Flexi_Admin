import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/errors/exceptions.dart';
import 'package:admin/core/utils/managers/local_storage.dart';

class Texts {
  static const String userEmail = 'UserEmail';
  static const String userPassword = 'UserPassword';
  static const String isRememberMe = 'IsRememberMe';
}

abstract interface class UserLocalDatasource {
  Future<void> saveUserEmailAndPassword(LoginParams params);
  Future<LoginParams> getUserEmailAndPassword();
  Future<void> deleteUserAndEmail();

  Future<void> saveRememberMe();
  Future<bool> isRememberMe();
  Future<void> deleteRememberMe();
}

class UserLocalDatasourceImp implements UserLocalDatasource {
  final LocalStorage storage;

  UserLocalDatasourceImp({required this.storage});

  @override
  Future<LoginParams> getUserEmailAndPassword() async {
    final email = await storage.fetchString(Texts.userEmail);
    final password = await storage.fetchString(Texts.userPassword);

    if (email == null || email.isEmpty) {
      throw Exception('No email found!');
    }

    if (password == null || password.isEmpty) {
      throw Exception('No password found!');
    }

    return LoginParams(email: email, password: password);
  }

  @override
  Future<bool> isRememberMe() async {
    final result = await storage.fetchBool(Texts.isRememberMe);

    if (result == null) throw CacheException(message: 'No data found');

    return result;
  }

  @override
  Future<void> saveRememberMe() async {
    await storage.storeBool(Texts.isRememberMe, true);
  }

  @override
  Future<void> saveUserEmailAndPassword(LoginParams params) async {
    await storage.storeString(Texts.userEmail, params.email);
    await storage.storeString(Texts.userPassword, params.password);
  }

  @override
  Future<void> deleteRememberMe() async {
    await storage.removeData(Texts.isRememberMe);
  }

  @override
  Future<void> deleteUserAndEmail() async {
    await storage.removeData(Texts.userEmail);
    await storage.removeData(Texts.userPassword);
  }
}
