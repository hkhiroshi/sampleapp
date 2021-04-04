import 'package:cloud_firestore/cloud_firestore.dart';

// Entity Model
class Book {
  // Initializer
  Book(DocumentSnapshot doc) {
    documentID = doc.documentID;
    title = doc['title'];
    imageURL = doc['imageURL'];
  }

  String documentID;
  String title;
  String imageURL;
}
