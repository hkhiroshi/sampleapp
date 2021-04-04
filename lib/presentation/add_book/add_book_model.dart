import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/domain/Book.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

// Domain Model
class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  File imageFile;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

  Future addBookTitle() async {
    if (bookTitle.isEmpty) {
      throw 'タイトルを入力してください';
    }
    final imageURL = await _uploadImage();

    Firestore.instance.collection('books').add({
      'title': bookTitle,
      'imageURL': imageURL,
      'createdAt': Timestamp.now(),
    });
  }

  Future updateBook(Book book) async {
    final document =
        Firestore.instance.collection('books').document(book.documentID);
    final imageURL = await _uploadImage();
    await document.updateData(
      {
        'title': bookTitle,
        'imageURL': imageURL,
        'updatedAt': Timestamp.now(),
      },
    );
  }

  Future<String> _uploadImage() async {
    final storage = FirebaseStorage.instance;
    StorageTaskSnapshot snapshot = await storage
        .ref()
        .child("images/$bookTitle")
        .putFile(imageFile)
        .onComplete;
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
