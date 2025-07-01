import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/images.dart';
import 'package:shop_app/features/models/product.dart';



List<Product> products = [
  Product(
      categoryId: '2',
      id: 'nmbkj',
      isPopular: false,
      name: 'Air Max Sequent 4 Shield',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 115,
      rating: 5,
      productColors: [
        Colors.grey.shade600,
        Colors.purple.shade400,
        Colors.pink.shade300,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh1,
        Images.sh2,
        Images.sh3,
        Images.sh4,
        Images.sh6,
      ]),
  Product(
      categoryId: '4',
      id: 'sfdbvad',
      isPopular: true,
      name: 'Nike High Run Pro',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 235,
      rating: 5,
      productColors: [
        Colors.blue.shade200,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh2,
        Images.sh1,
        Images.sh3,
        Images.sh4,
        Images.sh6,
      ]),
  Product(
      categoryId: '3',
      id: 'jhkj',
      isPopular: false,
      name: 'Random Color Shoe',
      brand: 'adidas',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 4,
      productColors: [
        Colors.orange.shade300,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh3,
        Images.sh2,
        Images.sh1,
        Images.sh4,
        Images.sh6,
      ]),
  Product(
      categoryId: '2',
      id: '87987',
      isPopular: true,
      name: 'Air Max 270 Ultramarine',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 4,
      productColors: [
        Colors.grey.shade600,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh7,
        Images.sh6,
        Images.sh1,
        Images.sh4,
        Images.sh3,
      ]),
  Product(
      categoryId: '1',
      id: '7987',
      isPopular: true,
      name: 'Runner Pro High Sole',
      brand: 'adidas',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 4,
      productColors: [
        Colors.amber.shade600,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh6,
        Images.sh4,
        Images.sh1,
        Images.sh7,
        Images.sh3,
      ]),
];
