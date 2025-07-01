import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';
import '../models/product.dart';

class FirebaseService {
  final _db = FirebaseFirestore.instance;

  Future<List<Category>> getCategories() async {
    final snapshot = await _db.collection('categories').get();
    return snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList();
  }

  Future<List<Product>> getProducts() async {
    final snapshot = await _db.collection('products').get();
    return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
  }

  Future<List<Product>> getPopularProducts() async {
    final snapshot = await _db
        .collection('products')
        .where('isPopular', isEqualTo: true)
        .get();
    return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
  }

  Future<List<Product>> search(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .orderBy('name')
        .startAt([query]).endAt([query + '\uf8ff']).get();
    print(snapshot);
    return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
  }
}
