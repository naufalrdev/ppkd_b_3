import 'dart:convert';

import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final String price;
  final IconData icon;

  ProductModel({required this.name, required this.price, required this.icon});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"name": name, "price": price, "icon": icon};
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map["name"] as String,
      price: map["price"] as String,
      icon: map["icon"] as IconData,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// IconData getIconFromString(String iconName) {
//   switch (iconName) {
//     case 'chair':
//       return Icons.chair;
//     case 'sofa':
//       return Icons.weekend;
//     default:
//       return Icons.help_outline;
//   }
// }
