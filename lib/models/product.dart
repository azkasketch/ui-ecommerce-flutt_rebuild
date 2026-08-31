import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final String price;
  final String oldPrice;
  final Color color;
  final IconData icon;
  final String tag;
  final String imageUrl;

  const Product({
    required this.name,
    required this.category,
    required this.price,
    required this.oldPrice,
    required this.color,
    required this.icon,
    required this.tag,
    required this.imageUrl,
  });
}
