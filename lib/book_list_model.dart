import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Book.dart';

// Domain Model
class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  // DartのFutureを使って非同期処理を書く
  // https://sbfl.net/blog/2015/01/05/writing-asynchronous-operation-with-future-in-dart/
  Future fetchBooks() async {
    final docs = await Firestore.instance.collection('books').getDocuments();
    final books = docs.documents.map((doc) => Book(doc['title'])).toList();
    this.books = books;
    notifyListeners();
  }
}
