import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String name;
  final String iconUrl;
  String? imageUrl;

  Category(
      {required this.id,
      required this.name,
      required this.iconUrl,
      required String imageUrl});

  factory Category.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category(
      imageUrl: 'imageUrl',
      id: doc.id,
      name: data['name'],
      iconUrl: data['iconUrl'],
    );
  }
}
