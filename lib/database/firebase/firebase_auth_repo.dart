import 'dart:developer' as dev;

import 'package:fadi_bring_me_app/database/repository/auth_repo.dart';
import 'package:fadi_bring_me_app/shared/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepo implements AuthRepo {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth;

  FirebaseAuthRepo({FirebaseAuth? firebaseAuth})
      : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      if (user == null) return null;
      return AppUser(userId: user.uid, email: user.email);
    } on FirebaseAuthException catch (e) {
      throw Exception(
          "Login fehlgeschlagen: ${e.message ?? 'Unbekannter Fehler'}");
    }
  }

  @override
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

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
      dev.log("Logged In Google");
    } on Exception catch (e) {
      dev.log('exception->$e');
    } catch (e) {
      // print(e);
      // print(s);
    }
    return;
  }

  @override
  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) return null;

      // Cloud Firestore
      // FirebaseFirestore.instance.collection("users").doc(user.uid).set({"username": username, "email": email});

      return AppUser(userId: user.uid, email: user.email);
    } catch (e) {
      throw Exception("Failed to create user: $e");
    }
  }

  // CustomUser

  @override
  AppUser? get currentUser {
    final user = firebaseAuth.currentUser;
    // final doc = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
    // final username = (doc.data() as Map<String,dynamic>)["username"];
    if (user == null) return null;
    return AppUser(userId: user.uid, email: user.email);
  }

  @override
  Future<void> signOut() async {
    dev.log("Du bist abgemeldet");
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
