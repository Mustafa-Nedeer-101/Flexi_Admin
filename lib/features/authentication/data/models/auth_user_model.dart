import 'package:admin/features/authentication/domain/entities/auth_user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUserModel extends AuthUserEntity {
  AuthUserModel({
    super.uid = '',
    super.emailVerified = false,
    super.isAnonymous = false,
    super.displayName,
    super.email,
    super.phoneNumber,
    super.photoUrl,
    super.refreshToken,
  });

  factory AuthUserModel.fromUser(User? user) {
    return AuthUserModel(
        uid: user?.uid ?? '',
        emailVerified: user?.emailVerified ?? false,
        isAnonymous: user?.isAnonymous ?? false,
        displayName: user?.displayName,
        email: user?.email,
        phoneNumber: user?.phoneNumber,
        photoUrl: user?.photoURL,
        refreshToken: user?.refreshToken);
  }
}
