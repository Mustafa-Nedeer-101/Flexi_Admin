import 'package:admin/features/authentication/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class UserRemoteDatasource {
  Future<void> createUser(UserModel user);
  Future<UserModel> fetchAdminDetails(String id);
}

class UserRemoteDatasourceImp implements UserRemoteDatasource {
  final _db = FirebaseFirestore.instance;

  // Create a record in database
  @override
  Future<void> createUser(UserModel user) async {
    return await _db.collection('Users').doc(user.id).set(user.toJson());
  }

  // Fetch a record from database
  @override
  Future<UserModel> fetchAdminDetails(String id) async {
    final docSnapshot = await _db.collection('Users').doc(id).get();

    return UserModel.fromSnapshot(docSnapshot);
  }
}
