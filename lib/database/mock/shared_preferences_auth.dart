import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/shared/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SharedPreferencesAuth implements AuthRepo {
  @override
  // TODO: implement authStateChanges
  Stream<User?> get authStateChanges => throw UnimplementedError();

  @override
  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentUser
  AppUser? get currentUser => throw UnimplementedError();

  @override
  Future<AppUser?> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
