import 'package:fadi_bring_me_app/shared/user.dart';

abstract class AuthRepo {
  Stream<AppUser?> get authStateChanges;

  AppUser? get currentUser;

  Future<AppUser?> signInWithEmailAndPassword(String email, String password);

  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password);

  Future<AppUser?> signInWithGoogle();

  Future<void> signOut();
}
