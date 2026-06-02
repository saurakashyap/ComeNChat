import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/cupertino.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserM _userFromUser(User user) {
    return user != null ? UserM(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(
              email: email, password: password);

      User user = credential.user;
      return _userFromUser(user);
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

      User user = credential.user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
