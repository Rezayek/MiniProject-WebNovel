import 'auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();

  AuthUser? get currentUser;
  Future<String?> token();

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> creatUser({
    required String email,
    required String password,
  });

  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({
    required String toEmail,
  });
}
