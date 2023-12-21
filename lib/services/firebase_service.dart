import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<bool> signUp(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('$credential');
      if (credential.user != null) return true;
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log('$e');
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log('$credential');
      if (credential.user != null) return true;
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      } else {
        log(e.code);
      }
      return false;
    }
  }
}
