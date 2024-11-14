class AuthUserEntity {
  String uid;
  bool emailVerified;
  bool isAnonymous;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? photoUrl;
  String? refreshToken;
  AuthUserEntity({
    this.uid = '',
    this.emailVerified = false,
    this.isAnonymous = false,
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.refreshToken,
  });
}
