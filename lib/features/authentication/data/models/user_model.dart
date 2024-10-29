import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/utils/formatters/foramtter.dart';

class UserModel {
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;
  final String? id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    this.role = AppRole.user,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    required this.email,
    this.phoneNumber = '',
    this.profilePicture = '',
  });

  // Helper Functions
  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber =>
      UFormatterUtils.formatPhoneNumber(phoneNumber);

  String get formattedDate => UFormatterUtils.formatDate(createdAt);
  String get formattedUpdatedAtDate => UFormatterUtils.formatDate(updatedAt);

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "flex_$camelCaseUsername";

    return usernameWithPrefix;
  }

  // return an empty model
  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '');

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
