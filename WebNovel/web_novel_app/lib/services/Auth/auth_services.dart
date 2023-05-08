import 'auth_provider.dart';
import 'auth_user.dart';
import 'firebase_auth_provider.dart';

class AuthServices implements AuthProvider {
  final AuthProvider provider;
  const AuthServices(this.provider);

  factory AuthServices.firebase() => AuthServices(FirebaseAuthProvider());
  @override
  Future<AuthUser> creatUser(
          {required String email, required String password}) =>
      provider.creatUser(email: email, password: password);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser> logIn({required String email, required String password}) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> sendPasswordReset({required String toEmail}) =>
      provider.sendPasswordReset(toEmail: toEmail);

  @override
  Future<String?> token() => provider.token();
}
