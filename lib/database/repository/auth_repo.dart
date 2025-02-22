import 'package:fadi_bring_me_app/shared/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Stream<User?> get authStateChanges;
  AppUser? get currentUser;
  Future<AppUser?> signInWithEmailAndPassword(String email, String password);
  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password, String username);
  Future<dynamic> signInWithGoogle();
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> updateEmail(String email);
  Future<void> deleteAccount(String userId);
}
