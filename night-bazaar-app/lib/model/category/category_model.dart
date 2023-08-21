import 'package:prototip/model/category/category.dart';

// Kategori modelini temsil eden sınıf.
class CategoryModel {
  String categoryTitle;
  List<Category> category;
  CategoryModel({
    required this.categoryTitle,
    required this.category,
  });
}
