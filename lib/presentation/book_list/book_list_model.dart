import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/domain/Book.dart';

// Domain Model
class BookListModel extends ChangeNotifier {
  List<Book> books = [];
  List<QueryDocumentSnapshot> qds = [];

  // DartのFutureを使って非同期処理を書く
  // https://sbfl.net/blog/2015/01/05/writing-asynchronous-operation-with-future-in-dart/
  Future fetchBooks() async {
    final snapshot = await FirebaseFirestore.instance.collection('books').get();
    final books = snapshot.docs.map((doc) => Book(doc)).toList();
    this.books = books;

    notifyListeners();
  }

  Future deleteBook(Book book) async {
    FirebaseFirestore.instance
        .collection('books')
        .doc(book.documentID)
        .delete();
  }
}
