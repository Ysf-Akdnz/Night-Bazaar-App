import 'package:flutter/material.dart';
import 'package:prototip/model/category/category.dart';
import '../model/category/category_model.dart';
import '../view/assets.dart';

// Kategori verisinin yönetildiği Riverpod sağlayıcısı.
class CategoryRiverpod extends ChangeNotifier {
  CategoryModel categoryModel =
      CategoryModel(categoryTitle: "Categories", category: [
    Category(
      image: Assets.images.imP2PNG,
      title: "iPhones",
    ),
    Category(
      image: Assets.images.imP1PNG,
      title: "Tablets",
    ),
    Category(
      image: Assets.images.imW1PNG,
      title: "Watches",
    ),
    Category(
      image: Assets.images.imC1PNG,
      title: "iMac",
    ),
  ]);
}
