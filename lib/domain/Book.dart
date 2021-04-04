import 'package:cloud_firestore/cloud_firestore.dart';

// Entity Model
class Book {
  // Initializer
  Book(DocumentSnapshot doc) {
    final data = doc.data();
    documentID = doc.id;
    title = data['title'];
    imageURL = data['imageURL'] != null
        ? data['imageURL']
        : 'https://firebasestorage.googleapis.com/v0/b/sample-app-d84d8.appspot.com/o/images%2Ftaki2?alt=media&token=9d193484-ff53-4961-9462-551f79f1057d';
  }

  String documentID;
  String title;
  String imageURL;
}
