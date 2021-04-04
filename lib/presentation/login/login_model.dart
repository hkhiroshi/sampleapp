import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/domain/Book.dart';
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

    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    ))
        .user;
  }
}
