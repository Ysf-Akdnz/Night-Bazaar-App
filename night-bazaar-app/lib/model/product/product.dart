import 'package:flutter/material.dart';

class Product {
  String image;
  String title;
  int price;
  double star;
  String descTitle;
  String desc;
  List<Color> colors;
  bool isSaved;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.star,
    required this.isSaved,
    required this.descTitle,
    required this.desc,
    required this.colors,
  });
}
