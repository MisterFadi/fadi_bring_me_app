import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/shared/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      print("Logged In Google");
    } on Exception catch (e) {
      print('exception->$e');
    } catch (e, s) {
      print(e);
      print(s);
    }
    return;
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
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

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
    print("Du bist abgemeldet");
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
