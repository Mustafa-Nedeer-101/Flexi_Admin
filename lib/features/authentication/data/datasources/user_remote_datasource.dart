import 'package:admin/features/authentication/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class UserRemoteDatasource {
  Future<void> createUser(UserModel user);
}

class UserRemoteDatasourceImp implements UserRemoteDatasource {
  // ignore: unused_field
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) {
    throw UnimplementedError();
  }
}
