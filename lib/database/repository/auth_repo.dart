import 'package:fadi_bring_me_app/shared/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Stream<User?> get authStateChanges;

  AppUser? get currentUser;

  Future<AppUser?> signInWithEmailAndPassword(String email, String password);

  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password);

  Future<dynamic> signInWithGoogle();

  Future<void> signOut();
}
