import 'package:cloud_firestore/cloud_firestore.dart';

// Entity Model
class Book {
  // Initializer
  Book(DocumentSnapshot doc) {
    documentID = doc.documentID;
    title = doc['title'];
  }

  String documentID;
  String title;
}
