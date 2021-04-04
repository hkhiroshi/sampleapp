import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/domain/Book.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Domain Model
class SignUpModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (mail.isEmpty) {
      throw ('Emailが入力されていません');
    }
    if (password.isEmpty) {
      throw ('パスワードが入力されていません');
    }

    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    ))
        .user;

    Firestore.instance.collection('users').add({
      'email': user.email,
      'createdAt': Timestamp.now(),
    });
  }
}
