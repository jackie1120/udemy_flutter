import 'package:flutter/material.dart';

class Product {
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final bool isFavorite;
  final String userEmail;
  final String userId;

  Product({
    @required this.title,
    @required this.imageUrl,
    @required this.price,
    @required this.description,
    this.isFavorite = false,
    @required this.userEmail,
    @required this.userId
  });
}