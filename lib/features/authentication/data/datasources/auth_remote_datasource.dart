import 'package:admin/core/network/params/params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDatasource {
  // Get authenticated user data
  User? authUser();

  // Get isAuthenticated user
  bool isAuthenticated();

  // Login
  Future<UserCredential> login(LoginParams params);
}

class AuthRemoteDatasourceImp implements AuthRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  User? authUser() {
    return _auth.currentUser;
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
}
