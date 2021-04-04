import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Domain Model
class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login() async {
    if (mail.isEmpty) {
      throw ('Emailが入力されていません');
    }
    if (password.isEmpty) {
      throw ('パスワードが入力されていません');
    }

    final User user = (await _auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    ))
        .user;
  }
}
