import 'package:admin/features/authentication/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin/core/constants/enums.dart';

class UserModel extends UserEntity {
  UserModel({
    super.role = AppRole.user,
    super.createdAt,
    super.updatedAt,
    super.id,
    super.firstName = '',
    super.lastName = '',
    super.username = '',
    required super.email,
    super.phoneNumber = '',
    super.profilePicture = '',
  });

  // return an empty model
  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '',
      role: AppRole.user);

  // return the Json version of the model
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Role': role.name.toString(),
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt = DateTime.now()
    };
  }

  // a constructor when passed an entity
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
        email: user.email,
        createdAt: user.createdAt,
        firstName: user.firstName,
        id: user.id,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        profilePicture: user.profilePicture,
        role: user.role,
        updatedAt: user.updatedAt,
        username: user.username);
  }

  // a constructor when data retrieved from a document
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          username: data.containsKey('Username') ? data['Username'] ?? '' : '',
          email: data.containsKey('Email') ? data['Email'] ?? '' : '',
          firstName:
              data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
          lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data.containsKey('ProfilePicture')
              ? data['ProfilePicture'] ?? ''
              : '',
          role: data.containsKey('Role')
              ? (data['Role'] ?? '') == AppRole.admin.name.toString()
                  ? AppRole.admin
                  : AppRole.user
              : AppRole.user,
          createdAt: data.containsKey('CreatedAt')
              ? data['CreatedAt'] is Timestamp
                  ? (data['CreatedAt'] as Timestamp).toDate()
                  : DateTime.now()
              : DateTime.now(),
          updatedAt: data.containsKey('UpdatedAp')
              ? data['UpdatedAt'] is Timestamp
                  ? (data['UpdatedAt'] as Timestamp).toDate()
                  : DateTime.now()
              : DateTime.now());
    } else {
      return empty();
    }
  }
}
