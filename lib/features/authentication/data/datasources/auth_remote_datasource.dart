import 'package:admin/core/network/params/params.dart';
import 'package:admin/features/authentication/data/models/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDatasource {
  // Get authenticated user data
  AuthUserModel authUser();

  // Get isAuthenticated user
  bool isAuthenticated();

  // Login
  Future<UserCredential> login(LoginParams params);

  // Logout
  Future<void> logout();
}

class AuthRemoteDatasourceImp implements AuthRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  AuthUserModel authUser() {
    final user = _auth.currentUser;

    return AuthUserModel.fromUser(user);
  }

  @override
  bool isAuthenticated() {
    return _auth.currentUser != null;
  }

  @override
  login(LoginParams params) async {
    final response = await _auth.signInWithEmailAndPassword(
        email: params.email, password: params.password);

    return response;
  }

  @override
  Future<void> logout() async {
    final response = await _auth.signOut();

    return response;
  }
}
