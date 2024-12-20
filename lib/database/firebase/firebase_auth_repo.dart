import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/shared/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<AppUser?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await firebaseAuth.signInWithCredential(credential);
    final user = authResult.user;
    if (user == null) return null;

    return AppUser(userId: user.uid, email: user.email);
  }

  @override
  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    final user = credential.user;
    if (user == null) return null;
    return AppUser(userId: user.uid, email: user.email);
  }

  @override
  Stream<AppUser?> get authStateChanges {
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      } else {
        return AppUser(
          userId: firebaseUser.uid,
          email: firebaseUser.email,
        );
      }
    });
  }

  @override
  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = credential.user;
    if (user == null) return null;
    return AppUser(userId: user.uid, email: user.email);
  }

  @override
  AppUser? get currentUser {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return AppUser(userId: user.uid, email: user.email);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
