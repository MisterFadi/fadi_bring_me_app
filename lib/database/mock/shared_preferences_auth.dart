import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/shared/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SharedPreferencesAuth implements AuthRepo {
  @override
  Stream<User?> get authStateChanges => throw UnimplementedError();

  @override
  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password, String username) {
    throw UnimplementedError();
  }

  @override
  AppUser? get currentUser => throw UnimplementedError();

  @override
  Future<AppUser?> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateEmail(String email) {
    throw UnimplementedError();
  }
}
