import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  String brand;
  String description;
  String categoryId;
  bool isPopular;
  double price;
  double rating;
  List<Color>? productColors;
  List<dynamic>? productImages;

  Product(
      {required this.name,
      required this.id,
      required this.isPopular,
      required this.categoryId,
      required this.brand,
      required this.description,
      required this.price,
      required this.rating,
      required this.productColors,
      required this.productImages});
  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      brand: data['brand'] ?? "null",
      description: data['description'] ?? "null",
      productColors: data['productColors'] ??
          [
            Colors.black,
          ],
      name: data['name'] ?? "null",
      productImages: data['imageUrl'] ?? "null",
      price: (data['price'] as num).toDouble() ?? 0.00,
      rating: (data['rating'] as num).toDouble() ?? 0.00,
      categoryId: data['categoryId'] ?? "null",
      isPopular: data['isPopular'] ?? false,
    );
  }
}
