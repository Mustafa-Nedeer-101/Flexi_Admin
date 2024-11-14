import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/utils/formatters/foramtter.dart';

class UserEntity {
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

  UserEntity({
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
}
